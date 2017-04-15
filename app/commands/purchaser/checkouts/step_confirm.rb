module Purchaser
  module Checkouts
    class StepConfirm < Rectify::Command

      def initialize(params, object)
        @params = params[:place_order]
        @order = object
      end

      def call
        return broadcast(:invalid) if @params == true
        broadcast(:ok, @order) if place_order
      end

    private

      def place_order
        @order.created_at = Time.now
        send_email if @order.person.respond_to?(:email)
        @order.place_order
        @order.save   
      end

      def send_email
        ApplicationMailer.send_email(@order.person, @order)
      end
    end
  end
end