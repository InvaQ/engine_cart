module Purchaser
  class Coupon < ApplicationRecord
    belongs_to :order, optional: true
  
    validates :code, presence: true, uniqueness: true, length: { maximum: 16 }
    validates :discount, presence: true
    validates :discount, numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 99 }
    def already_activated?
    order_id.present?
  end
  end
end