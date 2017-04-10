module Purchaser
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :set_order

    protected
    
    def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create
    session[:order_id] = @order.id
    @order
  end

  end
end
