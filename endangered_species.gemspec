
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "endangered_species/version"

Gem::Specification.new do |s|
  s.name          = "endangered_species"
  s.version       = EndangeredSpecies::VERSION
  s.date          = '2018-03-20'
  s.summary       = %q{Endangered Species in the world.}
  s.description   = %q{Provides details on the world's endangered species.}
  s.authors       = ["Jul Jen"]
  s.email         = ["juliajen.prog@gmail.com"]
  s.files         = ["lib/endangered_species.rb", "lib/endangered_species/cli.rb", "lib/endangered_species/scraper.rb", "lib/endangered_species/species.rb", "lib/endangered_species/articles.rb", "config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/endangered_species'
  s.license     = 'MIT'
  s.executables << 'endangered_species'


  s.add_development_dependency "bundler", "~> 1.16"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "pry", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
end
