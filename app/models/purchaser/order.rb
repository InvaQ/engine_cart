module Purchaser
  class Order < ApplicationRecord
    include AASM

    belongs_to :person, optional: true, polymorphic: true
    belongs_to :delivery, optional: true, class_name: 'Purchaser::Delivery'
    has_one :credit_card, dependent: :destroy, class_name: 'Purchaser::CreditCard'
    has_one :coupon, dependent: :nullify, class_name: 'Purchaser::Coupon'
    has_many :line_items, dependent: :destroy, class_name: 'Purchaser::LineItem'
    accepts_nested_attributes_for :line_items, allow_destroy: true
    
    has_one :shipping_address, as: :addressable, dependent: :destroy
    has_one :billing_address, as: :addressable, dependent: :destroy
  

  aasm column: :state, whiny_transitions: false do
    state :creating, initial: true

    
    state :steps
    state :confirm
    state :complete

    state :in_transit
    state :delivered
    state :canceled

    event :checkout do
      transitions from: :creating, to: :steps
    end
    
    event :filling_payment do
      transitions from: :steps, to: :confirm
    end
    
    event :place_order do
      transitions from: :confirm, to: :complete
    end

    event :bank_approval do 
      transitions from: :complete, to: :in_transit
    end

    event :sent do 
      transitions from: :in_transit, to: :delivered
    end

    event :canceling do
      transitions from: [ :creating, :steps, :complete, :confirm, :complete, :in_transit ], to: :canceled
    end
  end

    def add_product(product_id, type, quantity)
    current_item = line_items.find_by(product_id: product_id, product_type: type)
    if current_item
      current_item.quantity += quantity.to_i
    else
      current_item = line_items.build(product_id: product_id, product_type: type, quantity: quantity)
      current_item.price = current_item.product.price
    end
    current_item
  end

    def delivery_selected?(from_list)
      delivery.id == from_list if delivery
    end

    def amount_of_books
      line_items.sum('quantity')
    end

    def subtotal_cart_price
      line_items.inject(0) do |sum, line|
        sum + line.total_price
      end
    end

    def coupon_cost
      coupon ? subtotal_cart_price * coupon.discount/100 : 0.00
    end

    def delivry_cost
      delivery ? delivery.price : 0.00
    end

    def total_cart_price
      subtotal_cart_price - coupon_cost + delivry_cost
    end

    def generate_number
      '#R00' + id.to_s
    end

    def ordered_at
      created_at.strftime('%B %d, %Y')
    end

 
  end
end