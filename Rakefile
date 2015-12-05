require 'nanoc/tasks'
require 'sparql/client'
require 'yaml'

task :default => [:compile]

task :optimize_pngs do
  system('find', 'output', '-name', '*.png', '-exec', 'optipng', '-o7', '{}', ';')
end

task :build_production do
  system('cp', 'settings/prd.rb', 'settings.rb')
  Rake::Task["rebuild"].invoke
  Rake::Task["optimize_pngs"].invoke
end

task :publish do
  exit unless system("scripts/confirm.sh")
  system('nanoc', 'deploy', '-t', 'public')
end

task :fetch_tag_data do

  semantic_tags = YAML.load_file('etc/semantic_tags.yaml')

  FileUtils.mkdir_p('data')

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

  File.open("data/tag_data.yaml", 'w+') { |io| io.write(YAML.dump(data)) }
end
