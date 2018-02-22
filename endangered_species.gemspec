
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "endangered_species/version"

Gem::Specification.new do |spec|
  spec.name          = "endangered_species"
  spec.version       = EndangeredSpecies::VERSION
  spec.authors       = ["Jul Jen"]
  spec.email         = ["juliajen.prog@gmail.com"]

  spec.summary       = %q{Endangered Species in the world.}
  spec.description   = %q{Provides details on endangered species in all regions of the world.}
  spec.homepage      = "https://github.com/JulJen/endangered-species-cli-app"
  spec.license       = "MIT"


  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  #spec.bindir        = "exe"
  spec.executables   << "endangered-species-cli-app"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"

end
