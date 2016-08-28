require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'

Class.new(Nanoc::DataSource) do
  identifier :company

  def items
    items = []

    company_info = YAML.load_file('etc/company.yaml').deep_symbolize_keys

    items << new_item(
      '',
      { is_hidden: true }.merge(company_info[:company]),
      Nanoc::Identifier.new("/company/_"))
      
    company_info[:people].each do |person|
      items << person_to_item(person)
    end

    items

  end

  protected

  def person_to_item(person)
    full_name = "#{person[:first_name]} #{person[:last_name]}"
    slug = full_name.parameterize

    attributes = {
      kind: 'person',
      is_hidden: true
    }

    new_item(
      full_name,
      attributes.merge(person),
      Nanoc::Identifier.new("/company/people/_#{slug}"))
  end
      

end
