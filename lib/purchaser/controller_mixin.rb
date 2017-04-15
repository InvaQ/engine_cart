module Purchaser
  module ControllerMixin
    extend ::ActiveSupport::Concern
    module ClassMethods

      def act_as_purchaser_controller
        before_action :set_order
      end
    end
      def set_order
        @order = Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
        @order = Order.create
        session[:order_id] = @order.id
        @order
      end

      def current_customer
        return current_user if defined? Devise
        @order
      end
      
  end
end