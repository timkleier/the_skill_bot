require 'uri'

class Tweet < ApplicationRecord
  def send_tweet

  end

  def construct_tweet
    num = rand(1..3)
    send "tweet_base_#{num}"
  end

  def self.get_next_tweet
    where(sent: [nil, false]).first
  end

  def self.schedule_tweets
    platforms = ['Pluralsight', 'Coursera', 'Udemy', 'Udacity', 'edX']
    terms = [
      'Leadership', 'Management', 'Business Strategy', 'Entrepreneurship', 'Finance', 'Marketing',
      'Algorithms', 'Data Science', 'Computer Science', 'Information Technology', 'Software Development', 'Mobile Development', 'Design and Product', 'Cloud Computing', 'Application Security', 'Data Management', 'Computer Networking', 'Support and Operations', 'Graphic Design', 'Probability and Statistics',
      'Personal Development', 'Productivity', 'Habits', 'Soft Skills', 'Communication', 'Health & Nutrition',
      'Algebra', 'Calculus', 'Cryptography', 'Game Theory', 'Knowledge Graphs'
    ]

    terms.each do |term|
      platforms.each do |platform|
        Tweet.create(platform: platform, term: term)
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
