desc "Schedule Tweets"

task schedule_tweets: :environment do
  Tweet.schedule_tweets

  # Tweet
    # Properties
      # platform
      # term
    # Functions
      # Construct message according to platform and term
      # Send
      # Mark as sent

  # TweetScheduler
    # Instantiate new Tweet
    # Save to database (Tweet)

  # Heroku scheduler - Send off today's tweet
    # Get next scheduled tweet (just next scheduled or scheduled for certain day?)
    # Send tweet (instance of Tweet)
end
