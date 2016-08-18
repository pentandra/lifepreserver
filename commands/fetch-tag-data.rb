require 'sparql/client'
require 'yaml'

usage     'fetch-tag-data'
aliases   :fetchtags, :ft
summary   'fetches semantic tag data from the Web'

run do |opts, args, cmd|

  semantic_tags = YAML.load_file('etc/semantic_tags.yaml')

  FileUtils.mkdir_p('var')

  data = {}

  sparql = SPARQL::Client.new("http://dbpedia.org/sparql")

  semantic_tags.each do |tag, uri|
    query = <<-QUERY
      PREFIX dbo: <http://dbpedia.org/ontology/>
      PREFIX foaf: <http://xmlns.com/foaf/0.1/>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
      PREFIX owl: <http://www.w3.org/2002/07/owl#>

      SELECT ?abstract ?topic ?label ?type
      WHERE
      {
        <#{uri}> rdfs:label ?label ;
                 dbo:abstract ?abstract ;
                 foaf:isPrimaryTopicOf ?topic .
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

    puts "Querying remote endpoint for <#{uri}>…"

    sparql.query(query).each do |solution|
      data[tag] = { uri: uri }
      solution.each_binding { |name, v| data[tag][name] = v.value }
    end

  end

  puts "Writing tag data…"

  File.open("var/tag_data.yaml", 'w+') { |io| io.write(YAML.dump(data)) }

  puts "Finished!"
end
