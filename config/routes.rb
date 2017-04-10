Purchaser::Engine.routes.draw do
  root to: '/carts#show'

  resources :carts, only: [:show, :update]
  resources :line_items, only: :destroy
  resources :checkouts, only: [:show, :update]

end
