ENV['RAILS_ENV'] ||= 'test'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'

require 'rspec/rails'
require 'rectify/rspec'
require 'aasm/rspec'
require 'capybara/rspec'


Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each { |f| require f }


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config| 

  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include Rectify::RSpec::Helpers
  config.include FactoryGirl::Syntax::Methods
  config.include(Wisper::RSpec::BroadcastMatcher)
  config.include Capybara::DSL
  config.use_transactional_fixtures = true

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
