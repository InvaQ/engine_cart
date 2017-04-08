Purchaser::Engine.routes.draw do
  root to: '/carts#show'

  resources :carts, only: [:show, :update]
end
