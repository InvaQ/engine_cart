RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.include Shoulda::Matchers::ActiveModel
  config.include Shoulda::Matchers::ActiveRecord
  config.include FactoryGirl::Syntax::Methods
  config.include Rectify::RSpec::Helpers

  Shoulda::Matchers.configure do |matcher_config|
    matcher_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

end
