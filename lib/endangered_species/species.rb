# require 'pry'
# Species class used for storing data
# Create a method for facts class that parses HTML on the species link for these properties: population, scientific name, height, weight, length, habitats

class EndangeredSpecies::Species
  attr_accessor :name, :status, :url, :summary, :scientific, :habitat, :place

  @@all = []

  def self.all #class reader to expose @@all class variable
    @@all
  end

 #  def self.find(id)
 #   self.all[id-1]
 # end

  def save
    @@all << self
  end

end
