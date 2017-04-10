module Purchaser
  class LineItem < ApplicationRecord
    belongs_to :order, class_name: 'Purchaser::Order'
    belongs_to :product, polymorphic: true

    def total_price
      book.price * quantity
    end
  end
end
