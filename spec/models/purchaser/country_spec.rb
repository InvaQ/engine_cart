require 'rails_helper'

module Purchaser
  RSpec.describe Country, type: :model do
    it { should validate_presence_of(:name) }
    it { should have_many(:deliveries) }  
  end
end
