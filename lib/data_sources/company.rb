# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'net/ldap'
require 'net/ldap/dn'
require 'openssl'
require 'uri'
require 'time'

module LifePreserver
  module DataSources
    class Company < Nanoc::DataSource
      LDAP_GENERALIZED_TIME = '%Y%m%d%H%M%S%z'

      identifier :company

      def up
        @company_ldif =
          File.open(@config.fetch(:company_metafile)) do |file|
            Net::LDAP::Dataset.read_ldif(file)
          end
      end

      def items
        @company_ldif.map { |k, v| entry_to_item(k, v) }
      end

      # Maps an LDAP entry to a Nanoc item.
      #
      # @param dn_string [String] The distinguished name of the entry.
      # @param entry [Hash] The LDAP entry.
      #
      # @return [Nanoc::Core::Item] The new item generated from the entry.
      def entry_to_item(dn_string, entry)
        dn = Net::LDAP::DN.new(dn_string)
        rdn_seq = dn.enum_for(:each_pair).to_a
        entry_rdn = %i[key value].zip(rdn_seq.first).to_h

        case entry_rdn[:key]
        when 'o'
          org_to_item(entry_rdn[:value], entry)
        when 'uid'
          member_to_item(entry_rdn[:value], entry)
        end
      end

      def org_to_item(name, entry)
        slug = name.parameterize
        org = transform(entry)
        new_item(
          name,
          {
            kind: 'organization',
            name: org[:cn] || name,
            is_hidden: true,
          }.merge(org),
          File.join(@config.fetch(:organizations_root), slug),
          checksum_data: "name=#{name},updated_at=#{org.fetch(:updated_at)}",
        )
      end

      def member_to_item(name, entry)
        member = transform(entry)
        display_name = member[:displayname] || member[:cn]
        slug = display_name.parameterize

        attributes = {
          kind: 'member',
          name: display_name,
          slug: slug,
          web_id: member.dig(:pkey, 0, :id) || default_web_id(slug),

          # Page-related metadata
          full_title: "Personal profile of #{display_name}",
        }

        new_item(
          '-',
          attributes.merge(member),
          File.join(@config.fetch(:people_root), slug),
          checksum_data: "name=#{name},updated_at=#{member.fetch(:updated_at)}",
        )
      end

      def transform(entry)
        # If arrays have only one value, pull that value out
        t = entry.transform_values { |v| Array(v).length == 1 ? Array(v).first : v }

        # Parse create and modify timestamps
        t[:created_at] = ldap_time(t.delete(:createtimestamp))
        t[:updated_at] = ldap_time(t.delete(:modifytimestamp))

        # Recompose labeledURI attribute value assertions for all service profiles
        if t.key?(:labeleduri)
          t[:service_profiles] =
            Array(t.delete(:labeleduri)).map { |u| compose_service_profile(u) }.compact
        end

        # Extract the public key from user certificates
        if t.key?(:"usercertificate;binary")
          t[:pkey] = Array(t.delete(:"usercertificate;binary")).map { |c| extract_pkey(c) }.compact
        end

        t
      end

      # Parses a value as LDAP Generalized Time.
      #
      # @see https://tools.ietf.org/html/rfc4517#section-3.3.13 RFC4517
      #
      # @return [Time] The parsed time.
      def ldap_time(arg)
        Time.strptime(arg, LDAP_GENERALIZED_TIME)
      rescue ArgumentError
        Time.parse(arg)
      end

      # Compose a service profile from an LDAP labeledURI.
      #
      # @param labeleduri [String] An LDAP labeledURI.
      #
      # @return [Hash] A service profile, as described in {file:METADATA.md}.
      def compose_service_profile(labeleduri)
        hash = %i[uri label].zip(labeleduri.split(' ', 2)).to_h
        uri = URI.parse(hash[:uri])
        account_name = File.basename(uri.path)
        if hash.compact.fetch(:label, '')[/profile/i] && account_name.length > 1
          hash[:account_name] = account_name
          hash[:class] = hash.fetch(:label).split(' ').first.underscore

          # Set URI path to root to get the service homepage
          uri.path = '/'
          hash[:service_homepage] = uri.normalize.to_s

          hash
        end
      end

      # Extract a public key from an x509 certificate.
      #
      # @note Selects as the bound subject identifier the first URI subject
      #   alternate name of the certificate that starts with the base_url of
      #   the site configuration.
      #
      # @param raw_cert [String] A DER- or PEM-encoded certificate.
      #
      # @return [Hash, nil] If the given certificate is valid for this site,
      #   a hash containing the modulus and exponent of the given certificate's
      #   primary key, otherwise nil.
      def extract_pkey(raw_cert)
        cert = OpenSSL::X509::Certificate.new(raw_cert)

        return if cert.not_after < Time.now

        # TODO: check for base_url in site configuration?
        raw_san = cert.extensions.find { |x| %w[subjectAltName 2.5.29.17].include?(x.oid) }
        uri_san =
          if raw_san
            raw_san.value
                   .split(',')
                   .map { |v| %i[type id].zip(v.strip.split(':', 2)).to_h }
                   .find { |s| s[:type] == 'URI' && s[:id].start_with?(@site_config[:base_url]) }
          end
        return unless uri_san

        public_key = cert.public_key
        pkey_seq = OpenSSL::ASN1::Sequence([
          OpenSSL::ASN1::Integer.new(public_key.n),
          OpenSSL::ASN1::Integer.new(public_key.e),
        ])
        pkey_seq_der = pkey_seq.to_der

        {
          id: uri_san[:id],
          modulus: public_key.n.to_s(16),
          exponent: public_key.e.to_i,
          sha256: OpenSSL::Digest::SHA256.hexdigest(pkey_seq_der),
          sha1: OpenSSL::Digest::SHA1.hexdigest(pkey_seq_der),
          md5: OpenSSL::Digest::MD5.hexdigest(pkey_seq_der),
        }
      end

      # Provide the default WebID for a member.
      #
      # @note Does not require a WebID Certificate for a member to have a WebID.
      #
      # @note WebID is an exception to the normal URI design for this site (see
      #   {file:URI_DESIGN.md}) in order to conform to the current draft of the
      #   WebID spec (see https://www.w3.org/2005/Incubator/webid/spec/identity)
      #   which states that for "WebIDs with fragment identifiers (e.g. #me), the
      #   URI without the fragment denotes the Profile Document." We're doing it
      #   this way so as not to rely on WebID-TLS implementations following HTTP
      #   redirections, since that behavior is currently unspecified.
      #
      # @see People#local_web_id
      #
      # @param name [String] The name of the member.
      #
      # @return [String]
      def default_web_id(name)
        unless name
          raise ArgumentError.new('Cannot build default WebID: no member name')
        end

        if @site_config[:base_url].nil?
          raise Nanoc::Core::TrivialError.new('Cannot build default WebID: site configuration has no base_url')
        end

        File.join(@site_config[:base_url], @config[:people_root], name.parameterize, '#me')
      end
    end
  end
end
