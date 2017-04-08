module Purchaser
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :set_order

    protected
    

  end
end
