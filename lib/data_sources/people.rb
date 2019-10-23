# frozen_string_literal: true

require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'
require 'digest'

Class.new(Nanoc::DataSource) do
  identifier :people

  def up
    @people = YAML.load_file(@config[:people_data]).map(&:symbolize_keys)
  end

  def items
    @people.map do |person|
      person_to_item(person)
    end
  end

  protected

  def person_to_item(person)
    slug = person[:name].parameterize

    attributes = {
      kind: 'person',
      slug: slug,
      mtime: mtime_of(@config[:people_data]),
      is_hidden: true,
    }

    new_item(
      person[:name],
      attributes.merge(person),
      Nanoc::Identifier.new("/people/_#{slug}"),
      attributes_checksum_data: Digest::SHA1.digest(Marshal.dump(person)),
    )
  end

  def mtime_of(meta_filename)
    File.stat(meta_filename).mtime
  end
end
