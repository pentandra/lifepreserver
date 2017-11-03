#frozen_string_literal: true

usage     'fetch-tag-data'
aliases   :fetchtags, :ft
summary   'fetches additional data about semantic tags from the Web'

run do |_opts, _args, _cmd|
  require 'sparql/client'
  require 'yaml'
  require 'active_support/core_ext/hash/keys'

  tags = YAML.load_file('etc/tags.yaml').map(&:symbolize_keys)

  FileUtils.mkdir_p('var')

  data = []

  sparql = SPARQL::Client.new('http://dbpedia.org/sparql')

  tags.select { |t| t.key?(:uri) }.each do |tag|
    uri = tag[:uri]
    query = <<-QUERY
      PREFIX dbo: <http://dbpedia.org/ontology/>
      PREFIX foaf: <http://xmlns.com/foaf/0.1/>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX owl: <http://www.w3.org/2002/07/owl#>

      SELECT ?abstract ?primaryTopicOf ?label ?type
      WHERE
      {
        <#{uri}> rdfs:label ?label ;
                 dbo:abstract ?abstract ;
                 foaf:isPrimaryTopicOf ?primaryTopicOf .
          FILTER (langMatches(lang(?label), \"en\"))
          FILTER (langMatches(lang(?abstract), \"en\"))

        OPTIONAL {
          <#{uri}> a ?type .
          #FILTER (strStarts(str(?type), \"http://dbpedia.org/ontology/\"))
          FILTER (?type != owl:Thing) # Let's get something more specific
          FILTER NOT EXISTS {
            <#{uri}> a ?other .
            ?other rdfs:subClassOf ?type .
            FILTER (?other != ?type)
          }
        }
      }
    QUERY

    $stderr.puts "Querying remote endpoint for <#{uri}>…"

    sparql.query(query).each { |solution| solution.each_binding { |name, v| tag[name] = v.value } }

    data << tag
  end

  $stderr.puts 'Writing tag data…'

  File.open('var/additional_tag_data.yaml', 'w+') { |io| io.write(YAML.dump(data)) }

  $stderr.puts 'Finished!'
end
