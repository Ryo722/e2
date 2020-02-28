Rails.application.routes.draw do
  get 'home/top'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :line_items
  resources :carts
  resources :orders, only: [:new, :create]
  resources :orders_management, only: [:index, :edit] do
    put :confirm_payment
    put :deliver
  end
  devise_for :users
  resources :users
  resources :products do
    resources :taggings, only: [:new, :edit, :create, :update, :destroy]
  end
  resources :tags, except: :show
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
