require 'retrieve/pluralsight'

desc "SKOT fetches content"

namespace :retrieve do
  task pluralsight: :environment do |task, args|
    Retrieve::Pluralsight.get_content(args)
  end
end
