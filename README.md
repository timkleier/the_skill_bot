# The Skill Bot (SKOT)
This app is (mostly) automated in the task of gathering content from major
learning platforms (e.g. Coursera, Udemy, Pluralsight) and providing a searchable
interface for those courses. It also dynamically creates content for social media
(currently Twitter) and could eventually create blog posts (e.g. Top 10 Leadership Courses)

# Key Commands
```
# used in Heroku scheduler for sending next tweet
rails send_next_tweet

# in rails console, require Rake and then retrieve content from platforms for terms
require 'rake'; TheSkillBot::Application.load_tasks
Rake::Task['retrieve_content'].execute({platforms: ['coursera', 'udemy', 'udacity', 'edx', 'pluralsight'], terms: ['Leadership', 'Management', 'Business Strategy', 'Entrepreneurship', 'Finance', 'Marketing', 'Algorithms', 'Data Science', 'Computer Science', 'Information Technology', 'Software Development', 'Mobile Development', 'Design and Product', 'Cloud Computing', 'Application Security', 'Data Management', 'Computer Networking', 'Support and Operations', 'Graphic Design', 'Probability and Statistics',
  'Personal Development', 'Productivity', 'Habits', 'Soft Skills', 'Communication', 'Health & Nutrition',
  'Algebra', 'Calculus', 'Cryptography', 'Game Theory', 'Knowledge Graphs']})

# schedule tweets, ensure data is correct
Tweet.schedule_tweets
```
