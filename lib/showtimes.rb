require 'nokogiri'
require 'open-uri'
require 'pry'
# require "showtimes/theater.rb"

class Showtimes
  
  def welcome
    puts "\n"
    puts "**********************************************"
    puts "********** Movie Showtimes Near You **********"
    puts "**********************************************"
    puts "\n"
  end
  
  def showtimes_scraper
    puts "What's your zipcode?"
    url = gets.strip
    full_url = "https://www.google.com/movies?near=#{url}"

    theaters = []
    
    page = Nokogiri::HTML(open(full_url))
    page.css(".movie_results .theater").each do |s|
      t = {}
      t[:name] = s.css("h2.name a").text
      theaters << t
    end
    
    num = 0
    theaters.each do |t|
      t.each do |k, v|
        num += 1
        puts "#{num}: #{v}"
      end
    end
  end
  
  def display_theaters
  end
  
end
