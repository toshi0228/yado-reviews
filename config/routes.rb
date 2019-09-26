Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tops#index"
  resources :tops do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:show]
end