desc "SKOT Pluralsight"
task get_pluralsight_content: :environment do
  puts "Getting content from Pluralsight"

  require 'google_search_results'
  # TODO!!!! Put into environment variable
  client = GoogleSearchResults.new(q: "Pluralsight html", serp_api_key: "871e3c2d06e7317313a71776a84aa8cf49e063c721db84499a4b3c608143d74d" )
  results = client.get_hash

  results[:organic_results].each do |item|
    puts "Inserting #{item[:title]}"
    resource = Resource.new
    resource.title = item[:title]
    resource.description = item[:snippet]
    resource.link = item[:link]
    resource.save
  end
end
