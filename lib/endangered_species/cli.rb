# CLI controller - user interaction

class EndangeredSpecies::CLI

# Main / general user input

  def call
    puts ""
    puts "Welcome! Learn about World Wildlife Fund's conservation of species and the environment!"
    sleep 1
    puts ""
    puts "..."
    puts ""
    puts "...please wait one moment..."
    puts ""
    puts "..."
    make_species
    make_articles
    menu
  end

  def menu
    input = ""
    while !exit?(input)
      puts ""
      puts "Enter 1 if you would like to read more about endangered species."
      puts ""
      sleep 1
      puts "or"
      puts ""
      puts "Enter 2 if you would like to read the latest news articles from WWF."
      puts ""
      input = gets.strip
      if ["1", "one"].include?(input)
        sleep 1
        list_species
        choose_species(input)
      elsif ["2", "two"].include?(input)
        sleep 1
        list_articles
        choose_articles(input)
      else
        try_again
      end
    end
  end

  def goodbye
    sleep 1
    puts ""
    puts "Thanks for visiting!"
    puts ""
    exit
  end

  def try_again
    sleep 1
    puts ""
    puts "Not sure what you're looking for, please try again!"
    puts ""
    sleep 1
    continue
  end

  def continue
    input = ""
    while !exit?(input)
      puts ""
      puts "Return to main menu or exit? Enter Y or N."
      puts ""
      input = gets.strip
      if yes_user(input)
        menu
      elsif no_user(input)
        goodbye
      else
        try_again
      end
    end
  end

  # CLI - get user input for Info on species (Enter 1 at menu)

  def make_species
    EndangeredSpecies::Scraper.new.make_species
  end

  def list_species
    EndangeredSpecies::Species.all.each_with_index do |species, i|
      puts ""
      puts "#{i+1}. #{species.name}"
    end
  end

  def choose_species(input)
    input = ""
    while !exit?(input)
      puts ""
      puts ""
      puts "Please enter a number for which species you would like to learn more about:"
      puts ""
      input = gets.strip
      sleep 1
      if invalid?(input)
        continue_species
      elsif input.to_i-1 <= EndangeredSpecies::Species.all.size
        species = EndangeredSpecies::Species.all[input.to_i-1]
        print_species(species)
        print_more?(species)
      else
        continue_species
      end
      continue
    end
  end

  def print_more?(species)
    input = ""
    while !exit?(input)
      puts ""
      puts "Would you like to read more? Enter Y or N."
      puts ""
      input = gets.strip.downcase
      if yes_user(input)
        more_info(species)
        sleep 1
        continue_species
      elsif no_user(input)
        goodbye
      else
        try_again
      end
    end
  end

  def continue_species
    input = ""
    while !exit?(input)
      puts ""
      puts "Do you want to continue and learn about another species? Enter Y or N."
      puts ""
      input = gets.strip
      if yes_user(input)
        list_species
        choose_species(input)
      elsif no_user(input)
        continue
      else
        try_again
      end
    end
  end

  def print_species(species)
    puts ""
    puts "----------- #{species.name} ----------- "
    puts ""
    puts "Scientific name: #{species.scientific}"
    puts ""
    puts "Status: #{species.status}"
    puts ""
    puts "Website: #{species.url}"
    puts ""
  end

  def more_info(species)
    puts ""
    puts "----------- #{species.name} ----------- "
    puts ""
    puts "#{species.summary}"
    puts ""
    puts "#{species.habitat}"
    puts ""
  end

  # CLI - get user input for Articles on species (Enter 2 at menu)

  def make_articles
    EndangeredSpecies::Scraper.new.make_articles
  end

  def list_articles
    EndangeredSpecies::Articles.all.each_with_index do |articles, i|
      puts ""
      puts "#{i+1}. #{articles.title}"
    end
  end

  def choose_articles(input)
    input = ""
    while !exit?(input)
      puts ""
      puts ""
      puts "Please enter a number for which articles you would like to read:"
      puts ""
      input = gets.strip
      sleep 1
      if invalid?(input)
        try_again
      elsif input.to_i-1 <= EndangeredSpecies::Articles.all.size
        articles = EndangeredSpecies::Articles.all[input.to_i-1]
        print_articles(articles)
        continue_articles
      else
        continue_articles
      end
    end
  end

  def continue_articles
    input = ""
    while !exit?(input)
      puts ""
      puts "Do you want to continue reading articles? Enter Y or N."
      puts ""
      input = gets.strip
      if yes_user(input)
        list_articles
        choose_articles(input)
      elsif no_user(input)
        continue
      else
        try_again
      end
    end
  end

  def print_articles(articles)
    puts ""
    puts "----------- #{articles.title} ----------- "
    puts ""
    puts "Date: #{articles.date}"
    puts ""
    puts "Summary:"
    puts "#{articles.summary}"
    puts ""
    puts "More info:"
    puts "#{articles.url}"
    puts ""
  end

# Validate user input

  def is_numeric?(input)
    true if Integer(input) rescue false
  end

  def invalid?(input)
    true if !is_numeric?(input) || ["nil", "0"].include?(input) rescue false
  end

  def exit?(input)
    true if input == "exit" || input == "exit!" rescue false
  end

  def no_user(input)
    true if ["n", "no", "exit", "exit!"].include?(input.downcase) rescue false
  end

  def yes_user(input)
    true if ["y", "yes"].include?(input.downcase) rescue false
  end

end
