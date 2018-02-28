# require 'pry'

class EndangeredSpecies::CLI

  def call
    puts ""
    puts "Welcome! Help save our planet by learning more about the world's most endangered species and their habitats."
    start
  end


  def list_species
    @species = EndangeredSpecies::Species.scrape_species
    @species.each.with_index(1) do |species, i|
      puts "#{i}. #{species.name} - #{species.status}"
    end
  end

  def start
    input = nil
    while input != "exit"
      puts ""
      puts "What species would you like more information on?"
      puts ""
      list_species

      input = gets.strip.downcase

      if input.to_i > 0
        species_info = @species[input.to_i-1]
        puts ""
        puts "Species: #{species_info.name}"
        puts ""
        puts "Conservation status: #{species_info.status}"
        puts ""
        puts "Location: #{species_info.location}"
        puts ""
        puts "Habitat: #{species_info.habitat}"
        puts ""
        puts "Description:"
        puts ""
        puts "#{species_info.summary}"
        puts ""
        puts "For more information, visit:  #{species_info.url}"
      else
        goodbye
      end
    end
  end

  def goodbye
    puts ""
    puts "Would like you to continue? Enter Y or N"
    puts ""
    input = gets.strip.downcase
    # input = nil
    if input == "y"
      start
    elsif
      input == "n"
      puts ""
      puts "Thanks for visiting! Now go out there and make a difference for nature!"
      exit
    else
      puts ""
      puts "Not sure what you're looking for, please try again!"
      goodbye
    end
  end

end
