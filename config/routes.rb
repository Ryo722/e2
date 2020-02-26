Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :taggings, only: [:new, :edit, :create, :update, :destroy]
  end
  resources :tags, except: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
