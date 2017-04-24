require 'rails_helper'

module Purchaser
  RSpec.describe CreditCard, type: :model do
    context 'association' do
      it { should belong_to(:order) }
    end
  end
end
