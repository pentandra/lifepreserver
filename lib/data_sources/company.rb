# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
require 'net/ldap'
require 'net/ldap/dn'
require 'openssl'

Class.new(Nanoc::DataSource) do
  identifier :company

  def up
    company_metafile = File.open(@config.fetch(:company_metafile))
    @company_meta = Net::LDAP::Dataset.read_ldif(company_metafile)
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
    slug = name.parameterize
    new_item(
      name,
      {
        kind: 'organization',
        name: name,
        slug: slug,
        mtime: mtime_of(@config[:company_metafile]),
        is_hidden: true,
      }.merge(transform(entry)),
      Nanoc::Identifier.new("/company/_#{slug}"),
      #attributes_checksum_data: Digest::SHA1.digest(Marshal.dump(entry)),
    )
  end

  def member_to_item(name, entry)
    member = transform(entry)
    slug = name.parameterize

    full_name = member[:displayname] || member[:cn] || "#{member[:givenname]} #{member[:sn]}"
    attributes = {
      kind: 'member',
      name: full_name,
      slug: slug,
      mtime: mtime_of(@config[:company_metafile]),
      is_hidden: true,
    }

    new_item(
      name,
      attributes.merge(member),
      Nanoc::Identifier.new("/company/members/_#{slug}"),
      #attributes_checksum_data: OpenSSL::Digest::SHA1.digest(Marshal.dump(entry)),
    )
  end

  def transform(entry)
    # If arrays have only one value, pull that value out
    t = entry.transform_values { |v| Array(v).length == 1 ? Array(v).first : v }

    # Recompose labeledURI attribute value assertions
    if t.key?(:labeleduri)
      t[:labeleduri] = Array(t[:labeleduri]).map do |i|
        i.split(' ', 2).zip([:uri, :label]).map(&:reverse).to_h
      end
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

  def mtime_of(meta_filename)
    File.stat(meta_filename).mtime
  end
end
