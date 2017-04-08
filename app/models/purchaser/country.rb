module Purchaser
  class Country < ApplicationRecord
    has_many :deliveries, class_name: 'Purchaser::Delivery'
  
    validates :name, presence: true
  end
end
