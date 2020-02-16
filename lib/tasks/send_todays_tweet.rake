desc "Send Tweet"

task send_todays_tweet: :environment do
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = Rails.application.credentials.dig(:twitter_consumer_key)
    config.consumer_secret     = Rails.application.credentials.dig(:twitter_consumer_secret)
    config.access_token        = Rails.application.credentials.dig(:twitter_access_token)
    config.access_token_secret = Rails.application.credentials.dig(:twitter_access_token_secret)
  end

  tweet = Tweet.get_todays_tweet

  if tweet and !tweet.sent
    constructed_tweet = tweet.construct_tweet
    puts "sending tweet for #{Date.today}"
    client.update(constructed_tweet)
    tweet.update({ sent: true, sent_timestamp: Time.now })
  else
    puts "tweet not sent for #{Date.today}"
  end
end
