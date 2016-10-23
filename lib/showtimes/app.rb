class Showtimes::App
  
  attr_accessor :zipcode
  
  def welcome
    puts "\n"
    puts "**********************************************"
    puts "********** Movie Showtimes Near You **********"
    puts "**********************************************"
    puts "\n"
    start
  end
  
  def start
    puts "What is your zipcode?"
    @zipcode = gets.strip
    #TODO: handle if user's input is invalid
    
    Showtimes::Scraper.new.scrape_showtimes(zipcode)
    display_theaters
  end
  
  
  def display_theaters
    puts "\n"
    puts "These theaters are closest to #{zipcode}:"

    Showtimes::Theater.all.each.with_index do |t, index|
      puts "#{index+1}. #{t.name}"
    end
  end
  
  
  
end
