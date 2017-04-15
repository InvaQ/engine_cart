module Purchaser
  class StepAddressPresenter < Rectify::Presenter
    def initialize(current_user, order, billing=nil, shipping=nil)
      @billing = billing
      @shipping = shipping
      @order = order
      @user = current_user
      super()
    end


    def billing

      @billing ||= priority_address('billing')
    end

    def shipping
      @shipping ||= priority_address('shipping')  
    end
    private

    def priority_address(type)
      @order.send("#{type}_address") || @user.send("#{type}_address") || "Purchaser::#{type.capitalize}Address".constantize.new
    end

  end
end