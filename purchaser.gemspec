$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "purchaser/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "purchaser"
  s.version     = Purchaser::VERSION
  s.authors     = ["InvaQ"]
  s.email       = ["freerest02@gmail.com"]
  s.homepage    = "https://github.com/invaq"
  s.summary     = "ShoppingPurchase"
  s.description = "Description of Purchaser."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files = Dir["spec/`/*"]

  s.add_dependency "rails", " 5.0.1"

  #logic
  s.add_dependency 'rectify'
  s.add_dependency 'wicked'
  s.add_dependency 'aasm'
  #view
  s.add_dependency 'haml'
  s.add_dependency 'simple_form'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'turbolinks'
  #test
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'wisper-rspec'
  s.add_development_dependency "pg"
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'database_cleaner'

end
