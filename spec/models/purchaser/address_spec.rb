require 'rails_helper'

module Purchaser
  RSpec.describe Address, type: :model do

    describe 'Associations' do
      it { should belong_to(:addressable) }
    end
  end
end
