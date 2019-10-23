# frozen_string_literal: true

require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'
require 'digest'

Class.new(Nanoc::DataSource) do
  identifier :company

  def up
    @company_info = YAML.load_file(@config[:company_metafile]).deep_symbolize_keys
  end

  def items
    items = []

    company = @company_info[:company]
    items << new_item(
      '',
      {
        mtime: mtime_of(@config[:company_metafile]),
        is_hidden: true,
      }.merge(company),
      Nanoc::Identifier.new('/company/_'),
      attributes_checksum_data: Digest::SHA1.digest(Marshal.dump(company)),
    )

    @company_info[:members].each do |member|
      items << member_to_item(member)
    end

    items
  end

  protected

  def member_to_item(member)
    full_name = member[:full_name] || "#{member[:first_name]} #{member[:last_name]}"
    slug = full_name.parameterize

    attributes = {
      kind: 'member',
      slug: slug,
      mtime: mtime_of(@config[:company_metafile]),
      is_hidden: true,
    }

    new_item(
      full_name,
      attributes.merge(member),
      Nanoc::Identifier.new("/company/members/_#{slug}"),
      attributes_checksum_data: Digest::SHA1.digest(Marshal.dump(member)),
    )
  end

  def mtime_of(meta_filename)
    File.stat(meta_filename).mtime
  end
end
