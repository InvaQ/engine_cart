class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  act_as_purchaser_controller
end
