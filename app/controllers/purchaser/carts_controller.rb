require_dependency "purchaser/application_controller"

module Purchaser
  class CartsController < ApplicationController
    include Rectify::ControllerHelpers
    
    def show
      binding.pry
      present Purchaser::OrderSummaryPresenter.new(order: @order)
    end

    def update
      UpdateCart.call(params, @order) do
        on(:update_cart) { redirect_to cart_path(id: session[:order_id]),  notice: 'Cart was successfuly updated!' }
        on(:to_checkout) {redirect_to checkout_path(:address)}
        on(:invalid) {redirect_to cart_path(id: session[:order_id]) }
      end
    end

  end
end
