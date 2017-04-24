require 'rails_helper'

module Purchaser
  RSpec.describe LineItem, type: :model do
    it { should belong_to(:order) }
  end
end
