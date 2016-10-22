require 'nokogiri'
require 'open-uri'
require 'pry'
require "showtimes/scraper.rb"
require "showtimes/theater.rb"

class Showtimes
  
  def welcome
    puts "\n"
    puts "**********************************************"
    puts "********** Movie Showtimes Near You **********"
    puts "**********************************************"
    puts "\n"
  end
  
  def get_zipcode
    puts "What's your zipcode?"
    gets.strip
  end
  
  def
    
  end
  
end
