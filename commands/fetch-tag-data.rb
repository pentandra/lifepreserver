#frozen_string_literal: true

usage     'fetch-tag-data'
aliases   :fetchtags, :ft
summary   'fetches additional data about semantic tags from the Web'
description 'Runs a SPARQL query on DBpedia to fetch additional data about semantic tags'

class FetchTagData < ::Nanoc::CLI::CommandRunner
  def run
    require 'sparql/client'
    require 'yaml'

    tags =
      File.open('etc/tags.yaml') do |file|
        YAML.safe_load(file.read, filename: file.path, symbolize_names: true)
      end

    FileUtils.mkdir_p('var')

    data = []

    sparql = SPARQL::Client.new('http://dbpedia.org/sparql')

    tags.select { |t| t.key?(:uri) }.each do |tag|
      uri = tag[:uri]
      query = <<~QUERY
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

      $stderr.print "Querying remote endpoint for <#{uri}>… "
      sparql.query(query).each do |solution|
        $stderr.puts solution.inspect if debug?
        solution.each_binding { |name, v| tag[name] = v.value }
      end
      $stderr.puts 'done'

      data << tag
    end

    $stderr.print 'Writing tag data… '
    File.open('var/additional_tag_data.yaml', 'w') do |file|
      file.write(YAML.dump(data.map { |t| t.transform_keys(&:to_s) }))
    end
    $stderr.puts 'done'
  end
end

runner FetchTagData
