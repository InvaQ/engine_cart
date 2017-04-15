class ShopsController < ApplicationController

	def index
    @products = Car.all
	end

end