# require 'pry'

class EndangeredSpecies::Species

  attr_accessor :name, :summary, :status, :location, :habitat, :url

  def self.scrape_species
    species_1 = self.new
    species_1.name = "Tiger"
    species_1.status = "Endangered"
    species_1.location = "Amur-Heilong, Eastern Himalayas, Borneo and Sumatra, Greater Mekong"
    species_1.habitat = "Forest Habitat"
    species_1.url = "https://www.worldwildlife.org/species/tiger"
    species_1.summary = "The largest of all the Asian big cats, tigers rely primarily on sight and sound rather than smell for hunting. They typically hunt alone and stalk prey. A tiger can consume up to 88 pounds of meat at one time. On average, tigers give birth to two to four cubs every two years. If all the cubs in one litter die, a second litter may be produced within five months."

    species_2 = self.new
    species_2.name = "Polar Bear"
    species_2.status = "Vulnerable"
    species_2.location = "Artic"
    species_2.habitat = "Polar Regions"
    species_2.url = "https://www.worldwildlife.org/species/polar-bear"
    species_2.summary = "Polar bears are classified as marine mammals because they spend most of their lives on the sea ice of the Arctic Ocean. They have a thick layer of body fat and a water-repellant coat that insulates them from the cold air and water. Considered talented swimmers, they can sustain a pace of six miles per hour by paddling with their front paws and holding their hind legs flat like a rudder."

    [species_1, species_2]
  end
end
