
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "./lib/taste_of_the_world/version"

Gem::Specification.new do |spec|
  spec.name          = "taste-of-the-world"
  spec.version       = TasteOfTheWorld::VERSION
  spec.authors       = ["'Robert Salaiz'"]
  spec.email         = ["'work.salaizrm@gmail.com'"]

  spec.summary       = %q{An app that helps you make any kind of dish from all over the world.}
  spec.description   = %q{This app allows you to select a cuisine(mexican,etc), style(Appetizer,etc.) and then select the dish you wanna make.}
  spec.homepage      = "https://github.com/Salaizrm/taste-of-the-world-CLI"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 13.0.1"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
