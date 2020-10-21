Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :groups, only: [:index, :new, :create]
  resources :events, only: [:index]
  resources :users, only: [:show, :edit, :update]
end
