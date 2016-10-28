class Showtimes::App
  
  attr_accessor :zipcode, :theater_choice
  
  def welcome
    puts "\n"
    puts "**********************************************"
    puts "********** Movie Showtimes Near You **********"
    puts "**********************************************"
    puts "\n"
    get_zip_code
  end
  
  def get_zip_code
    Showtimes::Theater.clear

    puts "What is your zipcode?"
    @zipcode = gets.strip
    
    if @zipcode !~ /\d{5}/
      system('clear') 
      puts "*****************************************************************"
      puts "***** Whoops. Looks like you entered an invalid zipcode. 😩  *****"
      puts "*****************************************************************"
      puts "\n"
      get_zip_code
    end
      
    Showtimes::Scraper.new.scrape_showtimes(zipcode)

    theater_selection
  end
  
  def what_next
    puts "\n"
    puts "That's it! What do you want to do next?"
    puts "1: try a new zipcode"
    puts "2: back to theaters"
    puts "3: exit"
    next_up = gets.strip
    if next_up == "1"
      get_zip_code
    elsif next_up == "2"
      theater_selection
    else
      system('clear') 
      puts "\n"
      puts "****************************************************"
      puts "********** BYEEEEEEEEEEE. See you soon! ♥ **********"
      puts "****************************************************"
      puts "\n"
      exit
    end
  end
  
  def display_theaters
    puts "\n"
    puts "These theaters are closest to #{zipcode}:"

    Showtimes::Theater.all.each.with_index do |t, index|
      puts "#{index+1}. #{t.name}"
    end
  end
  
  def theater_selection
    display_theaters    
    puts "\n"
    puts "For which theater do you wish to see the showtimes? (enter the number)"
    theater_choice = gets.strip.to_i
    display_showtimes(theater_choice)
    
    what_next
  end
  
  def display_showtimes(index)
    selection = Showtimes::Theater.all[index-1]
    stars = "*" * selection.name.length
    
    puts "\n"
    puts "*************************************#{stars}"
    puts "***** Movies playing today at #{selection.name}: *****"
    puts "*************************************#{stars}"
    puts "\n"

    selection.movies.each_with_index do |showtimes, index|
      puts "#{index+1}. #{showtimes[:movie_name]}"
      
      showtimes[:movie_times].each do |time|
        puts "   #{time}"
      end

      puts "\n"
    end
  end
  
end
