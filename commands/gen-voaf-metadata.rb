#frozen_string_literal: true

usage     'gen-voaf-metadata'
aliases   :gvm, :voaf
summary   'generates curated metadata for voaf vocabularies from the voaf dataset'

run do |_opts, _args, _cmd|
  require 'rdf'
  require 'rdf/turtle'
  require 'sparql'
  require 'yaml'

  $stderr.print 'Loading voaf dataset… '
  repository = RDF::Repository.load('var/datasets/lov.n3')
  $stderr.puts 'done'

  FileUtils.mkdir_p('var')

  data = {}

  query = <<-QUERY
    PREFIX dc:   <http://purl.org/dc/terms/>

    SELECT *
    WHERE {
      ?vocab dc:title ?title .
      ?vocab dc:description ?description .
      FILTER (langMatches(lang(?title), "en"))
      FILTER (langMatches(lang(?description), "en"))
    }
  QUERY

  $stderr.puts 'Querying data…'

  SPARQL.execute(query, repository).each do |solution|
    vocab = solution[:vocab].to_s.to_sym
    data[vocab] = {}
    solution.each_binding { |name, v| data[vocab][name] = v.value unless name == :vocab }
  end

  $stderr.print 'Writing metadata… '
  File.open('var/voaf_metadata.yaml', 'w') do |file|
    file.write(YAML.dump(data.sort.to_h))
  end
  $stderr.puts 'done'
end
