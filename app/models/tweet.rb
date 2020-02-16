require 'uri'

class Tweet < ApplicationRecord
  def send_tweet

  end

  def construct_tweet
    num = rand(1..3)
    send "tweet_base_#{num}"
  end

  def self.get_todays_tweet
    find_by(date_to_send: Date.today)
  end

  def self.schedule_tweets
    platforms = ['Pluralsight', 'Coursera', 'Udemy']
    terms = ['HTML', 'CSS', 'JavaScript', 'Full Stack Web Development', 'Web Development', 'Python', 'Machine Learning', 'Ruby', 'Ruby on Rails', 'React']

    num_days = 1
    platforms.each do |platform|
      terms.each do |term|
        Tweet.create(platform: platform, term: term, date_to_send: Date.today + num_days.days)
        num_days += 1
      end
    end
  end

  private

  def tweet_base_1
    "I just added #{platform} content for #{term} courses. Explore the results at #{skill_bot_url}. #{end_content}"
  end

  def tweet_base_2
    "Check out the new content I added from #{platform} on #{term}: #{skill_bot_url}. #{end_content}"
  end

  def tweet_base_3
    "The latest addition to my content catalog is #{term} courses on #{platform}: #{skill_bot_url}. #{end_content}"
  end

  def skill_bot_url
    "theskillbot.com?q=#{URI.encode(term.downcase)}&p=#{platform.downcase}"
  end

  def end_content
    "#theskillbot #learn ##{term.downcase.delete(' ')} @#{platform.downcase}"
  end
end
