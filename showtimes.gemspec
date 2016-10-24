Gem::Specification.new do |spec|
  spec.name          = "showtimes"
  spec.version       = "0.1.5"
  spec.authors       = ["Marine Boudeau"]
  spec.email         = ["m14868@gmail.com"]

  spec.summary       = "Movie Showtimes Near You"
  spec.description   = "Enter your zipcode, and we will tell you what movies you can go see tonight."
  spec.homepage      = "https://github.com/marineb/showtimes-cli-app"
  spec.license       = "MIT"

  spec.files = ["lib/showtimes.rb", 
                "lib/showtimes/app.rb",
                "lib/showtimes/scraper.rb",
                "lib/showtimes/theater.rb",
                "config/environment.rb"]
  spec.executables = ["showtimes"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 0"
  spec.add_development_dependency "pry", "~> 0"
end
