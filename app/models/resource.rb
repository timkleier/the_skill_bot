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
        title: 'Introduction to Web Development',
        description: 'Introduction to Web Development is a one-stop course that covers all of the tools you’ll need to create websites.',
        link: 'https://app.pluralsight.com/library/courses/web-development-intro'
      },
      {
        title: 'Computer Fundamentals: Mobile Devices',
        description: 'Any aspiring computer technician must be familiar with mobile devices. From smartphones to tablets and laptops, this course explores the unique hardware and software challenges of portable computers and phones.',
        link: 'https://app.pluralsight.com/library/courses/computer-fundamentals-mobile-devices'
      },
      {
        title: 'HTML, CSS, and JavaScript: The Big Picture',
        description: "In this course, you'll learn what HTML, CSS, and JavaScript are and how they interact to bring content to your browser.",
        link: 'https://app.pluralsight.com/library/courses/html-css-javascript-big-picture'
      },
      {
        title: 'JavaScript: From Fundamentals to Functional JS',
        description: "Solidify your knowledge of objects, arrays, and prototypes in JavaScript. Master closures, use higher-order functions/callbacks, and learn underscore.js.",
        link: 'https://app.pluralsight.com/library/courses/javascript-from-fundamentals-to-functional-js'
      }
    ]
  end
end
