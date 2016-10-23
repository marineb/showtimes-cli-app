class Showtimes::App
  
  def welcome
    puts "\n"
    puts "**********************************************"
    puts "********** Movie Showtimes Near You **********"
    puts "**********************************************"
    puts "\n"
  end
  
  def showtimes_scraper
    puts "What's your zipcode?"
    zipcode = gets.strip
    url = "https://www.google.com/movies?near=#{zipcode}"

    theaters = []
    
    page = Nokogiri::HTML(open(url))
    page.css(".movie_results .theater").each do |s|
      t = {}
      t[:theater] = s.css("h2.name a").text
      t[:movie] = s.css(".movie .name a").text # need to loop through those 
      theaters << t
    end
    theaters
    
    # [
    #   {
    #     :theater => "something",
    #     :movie => "foodcoop",
    #   }
    # ]
    
    puts "\n"
    puts "These theaters are closest to #{zipcode}:"
    num = 0
    theaters.each do |t|
      num += 1
      puts "#{num}: #{t[:theater]}"
      # puts "#{num}: #{t[:movie]}"    
    end
    
    puts "\n"
    puts "Enter a theater number to see its movies and showtimes:"
    theater_selection = gets.strip
    
    
  end
  
  def display_theaters
  end
  
end
