class Showtimes::Theater
  
  attr_accessor :name, :movies
  
  @@all_theaters = []
  
  def initialize(name=nil, movies=nil)
    @name = name
    @movies = movies
    @@all_theaters << self
  end
  
  def self.new_from_index_page(t)
    the_movies = []
    teh_movies << t.css(".movie name a").text
    self.new(t.css("h2.name a").text, the_movies)
  end
    
  def self.all
    @@all_theaters
  end
    
end