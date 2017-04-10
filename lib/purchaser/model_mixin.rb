module Purchaser
  module ModelMixin
    extend ::ActiveSupport::Concern
    module ClassMethods

      def act_as_person
        has_many :orders, class_name: 'Purchaser::Order', as: :person
        has_one :shipping_address, class_name: 'Purchaser::BillingAddress',
         as: :addressable, dependent: :destroy
        has_one :billing_address, class_name: 'Purchaser::ShippingAddress',
         as: :addressable, dependent: :destroy
      end

      def act_as_product
        has_many :line_items, class_name: 'Purchaser::LineItem', as: :product
      end

    end
  end
end