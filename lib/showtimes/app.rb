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
    #TODO: offer a menu upon each prompt (go back, exit, etc)
    
    Showtimes::Scraper.new.scrape_showtimes(zipcode)
    display_theaters
    
    puts "\n"
    puts "For which theater do you wish to see the showtimes? (enter the number)"
    
    theater_choice = gets.strip.to_i
    display_showtimes(theater_choice)
    
  end
  
  
  def display_theaters
    puts "\n"
    puts "These theaters are closest to #{zipcode}:"

    Showtimes::Theater.all.each.with_index do |t, index|
      puts "#{index+1}. #{t.name}"
    end
  end
  
  def display_showtimes(index)
    Showtimes::Theater.all[index-1].movies.each do |showtimes|
      puts "#{showtimes}"
    end
  end
  
  
  
end
