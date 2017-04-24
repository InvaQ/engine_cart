module Purchaser
  module Checkouts
    class StepDelivery < Rectify::Command

      def initialize(params, object)
        #binding.pry
        @params = params[:delivery_id]
        @order = object
      end

      def call
        return broadcast(:invalid) unless valid?  
        broadcast(:ok, @order) if add_delivery
      end

      private

      def add_delivery
        @order.assign_attributes(delivery_id: @params)
        @order.total_price = @order.total_cart_price
        @order.person = current_customer unless @order.person_id
        @order.save
      end

      def valid?
        Delivery.exists?(@params)
      end
    end
  end
end