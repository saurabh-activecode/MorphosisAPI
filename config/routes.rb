Rails.application.routes.draw do
  resources :orders
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'users/login'
  get 'cart', to: 'carts#cart'
  get 'cart/add_product/:product_id/:quantity', to: 'carts#add_product'
  put 'cart/update_product/:product_id/:quantity', to: 'carts#update_product'
  delete 'cart/remove_product/:product_id', to: 'carts#remove_product'
end
