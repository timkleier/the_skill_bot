require 'google_search_results'

module Retrieve
  module Pluralsight
    def self.get_content(args)
      puts "Getting content from Pluralsight"

      args[:terms].each do |term|
        # TODO!!!! Put into environment variable
        client = GoogleSearchResults.new(q: "Pluralsight #{term}", serp_api_key: ENV['SERP_API_KEY'] )
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
# Rake::Task['retrieve:pluralsight'].execute({terms: ['CSS']})
