require 'google_search_results'

module Retrieve
  module Pluralsight
    def self.get_content(args)
      puts "Getting content from Pluralsight"

      args[:terms].each do |term|
        # TODO!!!! Put into environment variable
        client = GoogleSearchResults.new(q: "Pluralsight #{term}", serp_api_key: Rails.application.credentials.dig(:serp_api_key) )
        results = client.get_hash

        records_to_upsert = []
        results[:organic_results].each do |item|
          resource = {}
          resource[:platform] = 'pluralsight'
          resource[:title] = item[:title].split('|')[0].strip
          resource[:description] = item[:snippet]
          resource[:link] = item[:link]
          resource[:created_at] = Date.today
          resource[:updated_at] = Date.today
          records_to_upsert << resource
        end

        Resource.upsert_all(records_to_upsert, unique_by: :index_resources_on_title_and_platform)
      end
    end
  end
end

# require 'rake'
# TheSkillBot::Application.load_tasks
# Rake::Task['retrieve:pluralsight'].execute({terms: ['CSS']})
