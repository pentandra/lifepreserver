require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'
require 'rdf'
require 'rdf/vocab'

Class.new(Nanoc::DataSource) do
  identifier :vocabularies

  def up
    @voaf_metadata ||= YAML.load_file('var/voaf_metadata.yaml')
  end

  def down
    #@voaf_metadata = nil
  end

  def items
    items = []

    @config[:prefixes_used].each do |group_name, group|
      group.each do |prefix|
        vocab = RDF::Vocabulary.find_by_prefix(prefix)
        items << vocabulary_to_item(vocab, group_name)
      end
    end

    items
  end

  protected

  def vocabulary_to_item(vocab, group_name)
    prefix = vocab.__prefix__
    metadata = extract_metadata_from(vocab)

    attributes = {
      kind: 'vocabulary',
      prefix: prefix,
      group: group_name,
      namespace_uri: vocab.to_uri.value,
      is_hidden: true,
    }

    new_item(
      '',
      attributes.merge(metadata),
      Nanoc::Identifier.new("/vocabularies/#{group_name.to_s.parameterize}/#{prefix.to_s.parameterize}"),
    )
  end

  # @return [Hash]
  def extract_metadata_from(vocab)
    vocab_uri = vocab_uri(vocab)
    metadata = @voaf_metadata.fetch(vocab_uri.to_sym, {})
    metadata[:vocab_uri] = vocab_uri

    if metadata.key?(:description)
      metadata[:description] = cleanup(metadata[:description])
    end

    metadata
  end

  def cleanup(text)
    text = text.upcase_first
    text[/[.!?]$/] ? text : text << '.'
  end

  def vocab_uri(vocab)
    # HACK: until we have better handling of ontology definitions at a
    # different uri than the namespace uri.
    if vocab == RDF::Vocab::VOID
      return 'http://vocab.deri.ie/void'
    end

    vocab.ontology ? vocab.ontology.value : vocab.to_uri.value
  end
end
