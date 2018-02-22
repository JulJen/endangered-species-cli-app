The gemspec at /Users/jjenprog/Code/FlatironSchool/adopt_animal/adopt_animal.gemspec is not valid. Please fix this gemspec. (Gem::InvalidSpecificationException)
The validation error was '"Put your gem's website or public repo URL here." is not a URI'
ChePasoJ:adopt_animal jjenprog$ bundle
You have one or more invalid gemspecs that need to be fixed.
The gemspec at /Users/jjenprog/Code/FlatironSchool/adopt_animal/adopt_animal.gemspec is not valid. Please fix this gemspec.
The validation error was '"Put your gem's website or public repo URL here." is not a URI'

Pattern and structures of a Gem:

SUMMARY
Planning the gem.
Beginning the building process.
Setting up or generating the basic structure of the gem.
Creating and stubbing out the executable file.
requiring files with require and require_relative.
Coding the CLI class — our controller.
Stubbing out the CLI class with hard-coded return data.
Creating the menu.
Setting up our Deal class.
#today method to return today's deals.
Stubbing out our first Deal instances with hard-coded data.
Setting up the Deal class attributes.
Testing our data in the console.
Wire up our menu with conditional logic to work with our array of deals.
Iterate over and display deals.
Fix spelling on #availability.
Setting up our scraper class — should we use a Deal class method or a standalone class?
Set up Deals#scrape_deals method.
Adding gem dependencies to the app.
Add dependencies to gemspec.
Development dependencies or runtime dependencies?
Code individual scrape methods for each site.
Use CSS selectors to scrape desired information.
Create new Deal objects and set the attributes based on the scraped info.
Update logic for #availability.
Final thoughts and tips on the building process.



How to build a CLI Gem

1. Plan your gem, imagine your interface

2. Start with the project structure - google

3. Start with the entry point - the file run
  - First file to make is an 'executable' file in bin called adopt-animal (not a ruby file), add line '#!/usr/bin/env ruby' so that it can be interpreted through ruby
  - Make a quick test to see if you run file
  - Operating system protects you from running files with arbitrary code without you 'explicitly' allowing permission
  - ls-lah -> shows permission for file:
    read and write permissions, no executable permission
  - add executable permission, in terminal: chmod +x adopt-animal
  - in terminal, this should return the test: ./adopt-animal
  - operating system now knows how to interpret file using ruby with shebang line and permission to execute it

4. Force that to build/discover the CLI interface/class
  - keep it simple: AdoptAnimal::CLI.new.call
  - start program with this pattern: class called "CLI" - instantiate 'new' and call 'call' method
  - Tip: always look for new "errors"
  - lay-out one step at a time for encapsulating logic for CLI interface:
    - set-up 'bin' file (so you don't have to program in it anymore and can program everything into the object entirely -> AdoptAnimal::CLI.new.call) Encapsulation! discover new objects!

  - in folder lib/adopt_animal -> stub of what I imagine interface being for 'CLI controller' -> model-view controller -> business logic, user interaction, dealing with input
  - thinking about a 'bin file' -> loading 'interpreter' & 'environment'
    - test patterns for loading 'environment' using 'require'
  - order of execution:
    - in bin/adopt-animal, line 3 is requiring:   
      - lib/adopt-animal: loading main lib of 'adopt_animal' (might have to change load dependency)
      - in lib/adopt-animal:
       will require all other files -> 'require_relative './adopt_animal/cli' (loads 'cli' file)
        - requiring 'version'
        - defining name space (why do you need module defined here if 'version' file takes care of it, and is loaded first)
      - in lib/adopt-animal acts as  'environment', single file that requires all other 'dependencies'

5. Stub out the interface
  - Discover what you need to program:
    - define execution point (in bin - file that will run), anything that needs 'environment' will load through one-line-call: require './lib/adopt_animal'
    - bin file creates new instance of 'controller CLI' and calls 'call' method on it (which starts cli.rb):
      -   def call
            list_animals
            menu
            goodbye
          end
    - stub out:
      - in 'cli', get interface working without real data. eventually scrape
      - 'heredoc' -> '<<-DOC' , builds multi-line strings
      - procedural method - defining all things I want to do:
        - starting CLI interface begins 'call' method

        - A command line interface for animal adoption, starting with animal types: adopt-animal
          - Show a list of animals:
            1. Dog - Australian Shepherd - Young - White with Black - Male
            2. Cat - Domestic Medium Hair - Senior - Gray - Male
            3. Rabbits
            4. Birds
            5. Equine
            6. Pigs
            7. Barnyard
            8. Small & Furry
            9. Other

            https://bestfriends.org/adopt/adopt-our-sanctuary/12660900/dundee
            Name: DUNDEE
            Breed: Australian Shepherd
            Age: Young
            Color: White with Black
            Sex: Male

            https://bestfriends.org/adopt/adopt-our-sanctuary/9166527/coyote-man
            Name: COYOTE MAN
            Breed: Domestic Medium Hair (medium coat)
            Primary Breed: Domestic Medium Hair
            Age: Senior
            Color: Gray
            Sex: Male

6. Start making things real!
  - program code that you wish you had!
  - make more progress, discover what it needs, figure it out as you move along!
  - think about objects with one responsibility
    -  class method that returns a whole bunch of 'adoptions'
        # 'object' called 'Adoption' with 'class method' called 'animals' that should return adoptions
        instance variable? not sure
        @adoption = AdoptAnimal::Adoption.animals
        make a new file for animals!
  - continue to stub out. make sure method call is working
    - problem:
      - in terminal: ./bin/adopt-animal
        - returns: uninitialized constant AdoptAnimal::Animal (NameError)
    solution: program doesn't know about file, require file in lib/adopt_animal.rb
    <!-- - What is an animal adoption?
    animal_1 = self.new
      - Animal =
      - Breed = dog
      - Sex = male
      - Age = young
      - Vaccinated = yes
      - Location = Manhattan Animal Care Center
      - url = "http://nycacc.org/adopt/johnny-cash-17537" -->
  - CLI ->
    - 'menu' method
      - get input
      - below is the logic

  - scraping
    - need dependencies, where do u put them?
      - treat regular depedencies seperate from development dependencies

7. Discover objects

8. Program!




  - Scraper
    - Newsletter
      - Articles
        the article should know almost nothing about the rest of the program

De-couple objects.

https://bestfriends.org/adopt/adopt-our-sanctuary

Executable - the file that is being run goes in bin directory

Project!
Create a gem, put into 'production'/'testing' environment

- 2 levels deep:
zipcode
data
