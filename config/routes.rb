Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :orders, only: [:new, :create]
  resources :orders_management, only: [:index]
  devise_for :users
  resources :users
  resources :products do
    resources :taggings, only: [:new, :edit, :create, :update, :destroy]
  end
  resources :tags, except: :show
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
