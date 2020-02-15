require 'retrieve_content'

desc "SKOT fetches content"

task retrieve_content: :environment do |task, args|
  RetrieveContent.get(args)
end
