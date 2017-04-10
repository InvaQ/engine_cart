require_relative 'model_mixin'
module Purchaser
  class Engine < ::Rails::Engine
    isolate_namespace Purchaser

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    config.assets.paths << File.expand_path('../../assets/stylesheets', __FILE__)
    config.assets.paths << File.expand_path('../../assets/javascripts', __FILE__)
    config.i18n.default_locale = :en

    # initializer "shopping_purchase", before: :load_config_initializers do |app|

    #   config.paths["db/migrate"].expanded.each do |expanded_path|
    #     Rails.application.config.paths["db/migrate"] << expanded_path
    #   end
    # end
    
  end

  ActiveSupport.on_load :active_record do
    ActiveRecord::Base.include(Purchaser::ModelMixin)
  end
end
