# Stores data on all Species

class EndangeredSpecies::Species
  attr_accessor :name, :status, :url, :summary, :scientific, :location, :habitat, :place

  @@all = []

  def self.all #class reader to expose @@all class variable
    @@all
  end

  def save
    @@all << self
  end

end
