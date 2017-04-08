module Purchaser
  class UpdateCoupon < Rectify::Command

    def initialize(params, object)
      @params = params
      @order = object
    end

    def call
      return false if dont_need_update
      use_coupon
    end  

    private
      attr_reader :params

      def dont_need_update
        @order.coupon == params[:code]
      end

      def use_coupon
        @order.coupon = Coupon.find_by_code(params[:code])
      end

	end
end