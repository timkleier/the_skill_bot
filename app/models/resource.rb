class Resource < ApplicationRecord

  def self.search(q)
    if q
      self.seeds.select{|resource| resource[:title].downcase.include?(q) || resource[:description].downcase.include?(q)}
    else
      self.seeds
    end
  end

  def self.seeds
    [
      {
        title: 'Web Development',
        description: 'Learn how to develop effective and captivating websites using the latest web development tools and practices.',
        link: 'https://www.pluralsight.com/courses/web-development-intro'
      },
      {
        title: 'Mobile Development',
        description: 'Mobile development refers to creating applications and any other kind of software development specific to mobile devices, including tablets and smart watches.',
        link: 'https://www.pluralsight.com/courses/html5-creating-offline-first-mobile-apps'
      },
      {
        title: 'JavaScript',
        description: 'Learn how to code in one of the most in-demand languages of today. Once familiar with JavaScript, you’ll understand how it compiles, optimizes and executes in the browser.',
        link: 'https://www.pluralsight.com/courses/javascript-fundamentals'
      }
    ]
  end
end
