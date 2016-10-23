class Showtimes::Theater
  
  attr_accessor :name, :movies
  
  @@all_theaters = []
  
  def initialize(name=nil, movies=nil)
    @name = name
    @movies = movies
    @@all_theaters << self
  end
  
  def self.new_from_index_page(t)
    movies = []
    
    t.css(".showtimes .movie").each do |m|
      movie = {}
      m.css(".name a").map do |movie_name|
        movie[:movie_name] = movie_name.text       
      end
      
      m.css(".times").map do |movie_time|
        times = []
        times << movie_time.text
        movie[:movie_times] = times 
      end
  
      movies << movie
    end
    
    self.new(t.css("h2.name a").text, movies)
  end
    
  def self.all
    @@all_theaters
  end
    
end