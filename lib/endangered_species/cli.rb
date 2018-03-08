# require 'pry'

# CLI controller - get user input
# CLI
#  Scraper
#   Species

class EndangeredSpecies::CLI

  def call
    puts ""
    puts "Welcome! Learn more about the world's most endangered species:"
    puts ""

    #priming
    EndangeredSpecies::Scraper.new.scrape_species_index
    list
    start
  end

  def list
    EndangeredSpecies::Species.all.each_with_index do |species, i|
      puts "#{i+1}. #{species.name}"
    end
  end

  def start
    input = ""
    while input != "exit"
      puts ""
      puts "Enter a number for which species you would like to learn more about:"
      puts ""
      input = gets.strip

      #how to deal with user input - create a method for it
      if input.to_i-1  <= EndangeredSpecies::Species.all.size
        species = EndangeredSpecies::Species.all[input.to_i-1]

        puts ""
        puts "#{species.name}"
        puts ""
        puts "Summary: #{species.summary}"
        puts ""
        puts "Website: #{species.url}"
        puts ""

        puts "Would you like to read more? Enter Y or N."
        input = gets.strip.downcase
        if ["y", "yes"].include?(input.downcase)
          # functionality - get content for species
          # build method in Species class
          puts species.url
        elsif ["n", "no"].include?(input.downcase)
          goodbye
        else
          puts ""
          puts "Not sure what you're looking for, please try again!"
          puts ""
          goodbye
        end
      end
    end
  end

  def goodbye
    input = ""
    while input != "exit"
      puts ""
      puts "Do you want to continue? Enter Y or N."
      puts ""
      input = gets.strip.downcase
      if ["y", "yes"].include?(input.downcase)
        start
      else ["n", "no", "exit"].include?(input.downcase)
        puts ""
        puts "Thanks for visiting!"
        puts ""
        exit
      end
    end
  end
end
