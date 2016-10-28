class Showtimes::Theater
  
  attr_accessor :name, :movies
  
  @@all_theaters = []
  
  def initialize(name = nil, movies = nil)
    @name = name
    @movies = movies
    @@all_theaters << self
  end
  
  def self.new_from_index_page(showtimes)
    movies = []
    showtimes.css(".showtimes .movie").each do |movie|
      movies << {
        movie_name: movie.css(".name a").text,
        movie_times: movie.css(".times").text.split(" &nbsp")
      }
    end
    self.new(showtimes.css("h2.name a").text, movies)
  end
    
  def self.all
    @@all_theaters
  end
  
  def self.clear
    @@all_theaters.clear
  end
    
end