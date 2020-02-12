require 'google_search_results'

module Retrieve
  module Pluralsight
    def self.get_content(args)
      puts "Getting content from Pluralsight"

      args[:terms].each do |term|
        # TODO!!!! Put into environment variable
        client = GoogleSearchResults.new(q: "Pluralsight #{term}", serp_api_key: "871e3c2d06e7317313a71776a84aa8cf49e063c721db84499a4b3c608143d74d" )
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
    end
  end
end

# require 'rake'
# TheSkillBot::Application.load_tasks
# Rake::Task['get_content:pluralsight'].execute({terms: ['CSS']})
