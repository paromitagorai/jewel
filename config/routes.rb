Rails.application.routes.draw do
  devise_for :admins
  resources :products
  resources :categories
  resources :orders
  devise_for :users
  resources :line_items
  resources :carts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/about'
  get 'home/cart'
end
