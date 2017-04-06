module Purchaser
  class LineItem < ApplicationRecord
    belongs_to :order

    def total_price
      book.price * quantity
    end
  end
end
