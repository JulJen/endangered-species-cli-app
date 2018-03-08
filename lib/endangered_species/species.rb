# require 'pry'
# Species class used for storing data
# Create a method for facts class that parses HTML on the species link for these properties: population, scientific name, height, weight, length, habitats

class EndangeredSpecies::Species
  attr_accessor :name, :status, :url, :summary, :facts

  @@all = []

  def self.all #class reader to expose @@all class variable
    @@all
  end

  # def initialize(name= nil, status= nil url= nil)
  #   @name = url
  #   @status = status
  #   @url = url
  #   @@all << self
  # end


  # def summary
  #   @summary ||= EndangeredSpecies::Scraper.new(url).scrape_species_index
  # end

  # def open_species #method used by CLI controller
  #   system("open '#{url}'")
  # end

  def save
    @@all << self
  end

end
