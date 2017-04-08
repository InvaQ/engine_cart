module Purchaser
  class LineItem < ApplicationRecord
    belongs_to :order, class_name: 'Purchaser::Order'

    def total_price
      book.price * quantity
    end
  end
end
