Purchaser::Engine.routes.draw do
  root to: '/carts#show'

  resources :cart, only: [:show, :update]
end
