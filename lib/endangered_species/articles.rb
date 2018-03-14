# Article class used for storing data

class EndangeredSpecies::Articles
  attr_accessor :title, :date, :summary, :url

  @@all = []

  def self.all #class reader to expose @@all class variable
    @@all
  end

  def save
    @@all << self
  end

end
