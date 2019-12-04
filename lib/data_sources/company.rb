# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'net/ldap'
require 'net/ldap/dn'
require 'openssl'
require 'phonelib'
require 'uri'
require 'time'

module LifePreserver
  module DataSources
    class Company < Nanoc::DataSource
      # @see https://tools.ietf.org/html/rfc4517#section-3.3.13 RFC4517
      LDAP_GENERALIZED_TIME = '%Y%m%d%H%M%S%z'

      identifier :company

      def up
        @company_meta =
          File.open(@config.fetch(:company_metafile)) do |file|
            Net::LDAP::Dataset.read_ldif(file)
          end
      end

      def items
        items = []

        @company_meta.each do |key, entry|
          dn = Net::LDAP::DN.new(key)
          dn_ary = dn.enum_for(:each_pair).to_a
          rdn = dn_ary.first
          items <<
            case rdn.first
            when 'o' then org_to_item(rdn.last, entry)
            when 'uid' then member_to_item(rdn.last, entry)
            end
        end

        items
      end

      protected

      def org_to_item(name, entry)
        org = transform(entry)
        new_item(
          name,
          {
            kind: 'organization',
            name: org[:cn] || name,
            is_hidden: true,
          }.merge(org),
          Nanoc::Identifier.new("/company/_#{name.parameterize}"),
          attributes_checksum_data: "name=#{name},updated_at=#{org.fetch(:updated_at)}"
        )
      end

      def member_to_item(name, entry)
        member = transform(entry)
        full_name = member[:displayname] || member[:cn] || "#{member[:givenname]} #{member[:sn]}"
        slug = full_name.parameterize

        attributes = {
          kind: 'member',
          name: full_name,
          slug: slug,
          is_hidden: true,
        }

        new_item(
          name,
          attributes.merge(member),
          Nanoc::Identifier.new("/company/members/_#{slug}"),
          attributes_checksum_data: "name=#{name},updated_at=#{member.fetch(:updated_at)}"
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
          profiles = []

          Array(t.delete(:labeleduri)).each do |labeleduri|
            hash = labeleduri.split(' ', 2).zip([:uri, :label]).map(&:reverse).to_h
            uri = URI.parse(hash[:uri])
            account_name = File.basename(uri.path)
            if hash.fetch(:label)[/profile/i] && account_name.length > 1
              hash[:account_name] = account_name
              hash[:class] = hash.fetch(:label).split(' ').first.underscore
              hash[:holder] = t[:displayname] || t[:o]

              # Set URI path to root to get the service homepage
              uri.path = '/'
              hash[:service_homepage] = uri.normalize.to_s

              profiles << hash
            end
          end
          t[:service_profiles] = profiles
        end

        # Extract the public key from user certificates
        if t.key?(:"usercertificate;binary")
          raw_certs = Array(t.delete(:"usercertificate;binary"))
          pkey_attributes = []
          raw_certs.each do |raw_cert|
            cert = OpenSSL::X509::Certificate.new(raw_cert)
            #cert_fpr = OpenSSL::Digest::SHA1.hexdigest(cert.to_der)

            public_key = cert.public_key

            pkey_seq = OpenSSL::ASN1::Sequence([
              OpenSSL::ASN1::Integer.new(public_key.n),
              OpenSSL::ASN1::Integer.new(public_key.e),
            ])
            pkey_seq_der = pkey_seq.to_der
            pkey_fpr_md5 = OpenSSL::Digest::MD5.hexdigest(pkey_seq_der)
            pkey_fpr_sha1 = OpenSSL::Digest::SHA1.hexdigest(pkey_seq_der)
            pkey_fpr_sha256 = OpenSSL::Digest::SHA256.hexdigest(pkey_seq_der)

            pkey_attributes << {
              modulus: public_key.n.to_s(16),
              exponent: public_key.e.to_i,
              sha256: pkey_fpr_sha256,
              sha1: pkey_fpr_sha1,
              md5: pkey_fpr_md5,
            }
          end
          t.merge!(pkey: pkey_attributes)
        end

        t
      end

      def ldap_time(arg)
        Time.strptime(arg, LDAP_GENERALIZED_TIME)
      rescue ArgumentError
        Time.parse(arg)
      end
    end
  end
end
