usage     'gen-voaf-metadata'
aliases   :gvm, :voaf
summary   'generates curated metadata for voaf vocabularies from the voaf dataset'

run do |_opts, _args, _cmd|
  require 'rdf'
  require 'rdf/turtle'
  require 'sparql'
  require 'yaml'

  $stderr.puts 'Loading voaf dataset…'

  repository = RDF::Repository.load('etc/datasets/lov.n3')

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

  $stderr.puts 'Writing metadata…'

  File.open('var/voaf_metadata.yaml', 'w+') { |io| io.write(YAML.dump(data)) }

  $stderr.puts 'Finished!'
end
