require 'rails_helper'

module Purchaser
  RSpec.describe CartsController, type: :controller do
    routes { Purchaser::Engine.routes }
    subject {create :order, :with_items}
    
    it '#show cart' do     
      get :show, id: subject.id
      assert_response 200
    end

  end
end
