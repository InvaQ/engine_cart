Rails.application.routes.draw do
  mount Purchaser::Engine => "/purchaser"
  root to: 'shops#index'
end
