class Theater
  
  #this is going to manage the list of theaters
  
  attr_accessor :name
  
  @@all_theaters = []
  
  def initialize(name)
    @name = name
    @@all_theaters << self
  end
  
  def self.all
    @@all_theaters
  end
  
end