Purchaser::Engine.routes.draw do
  root to:"carts#show"

  resources :carts, only: [:show, :update]
  resources :line_items, only: :destroy 
  resources :checkouts, only: [:show, :update]
  post 'create_line_item', to: 'line_items#create_line_item'

end
