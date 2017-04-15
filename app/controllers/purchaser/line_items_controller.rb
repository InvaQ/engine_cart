require_dependency "purchaser/application_controller"

module Purchaser
  class LineItemsController < ApplicationController
    
    
    def destroy
      @line_item = LineItem.find(params[:id])
      @line_item.destroy if @line_item
      redirect_to cart_path
    end

    def create_line_item
      @line_item = @order.add_product(product_params[:id], product_params[:type], product_params[:quantity])   
      if @line_item.save
        redirect_to :back
      else
        render action: 'new',  alert: "Somthing went wrong"
      end
    end


    private

    def product_params
      params.permit(:id, :type, :quantity)
    end

  end
end
