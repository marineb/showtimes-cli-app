class Showtimes::Theater
  
  attr_accessor :name
  
  @@all_theaters = []
  
  def initialize(name=nil)
    @name = name
    @@all_theaters << self
  end
  
  def self.new_from_index_page(t)
    self.new(t.css("h2.name a").text)
  end
    
  def self.all
    @@all_theaters
  end
    
end