module RetrieveContent
  def self.get(args)
    args[:platforms].each do |pf|
      platform = pf.downcase
      tld = self.platforms[platform]

      args[:terms].each do |term|
        puts "Getting content from #{platform} for #{term}"
        serp_results = self.get_serp_results(platform, term)
        records_to_upsert = self.get_records_to_upsert(serp_results, platform, tld)
        Resource.upsert_all(records_to_upsert, unique_by: :index_resources_on_title_and_platform)
      end
    end
  end

  def self.get_records_to_upsert(serp_results, platform, tld)
    records_to_upsert = []
    serp_results[:organic_results].each do |item|
      next unless item[:link].match("#{platform}.#{tld}")
      next if (!item[:link].match("courses") && platform == 'pluralsight')
      resource = {}
      resource[:platform] = platform.downcase
      resource[:title] = item[:title]
      resource[:description] = item[:snippet]
      resource[:link] = item[:link]
      resource[:created_at] = Date.today
      resource[:updated_at] = Date.today
      records_to_upsert << resource
    end
    records_to_upsert.uniq { |x| x[:title] }
  end

  def self.get_serp_results(platform, term)
    require 'google_search_results'
    client = GoogleSearchResults.new(q: "#{platform} #{term}", serp_api_key: Rails.application.credentials.dig(:serp_api_key) )
    client.get_hash
  end

  def self.platforms
    {
      'pluralsight' => 'com',
      'coursera' => 'org',
      'udemy' => 'com',
      'udacity' => 'com',
      'edx' => 'org'
    }
  end
end

# require 'rake'; TheSkillBot::Application.load_tasks
# Rake::Task['retrieve_content'].execute({platforms: ['pluralsight'], terms: ['JavaScript']})
