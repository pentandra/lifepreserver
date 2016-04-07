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
    query = "
      PREFIX dbpedia-owl: <http://dbpedia.org/ontology/>
      PREFIX foaf: <http://xmlns.com/foaf/0.1/>
      PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

      SELECT ?abstract ?topic ?label
      WHERE
      {
        <#{uri}> rdfs:label ?label ;
                 dbpedia-owl:abstract ?abstract ;
                 foaf:isPrimaryTopicOf ?topic .
          FILTER (langMatches(lang(?label), \"en\"))
          FILTER (langMatches(lang(?abstract), \"en\"))
      }"

    result = sparql.query(query).first

    next if result.nil?

    data[tag] = {
      "uri" => uri,
      "label" => result[:label].value,
      "abstract" => result[:abstract].value,
      "topic" => result[:topic].value
    }

  end

  File.open("var/tag_data.yaml", 'w+') { |io| io.write(YAML.dump(data)) }
end
