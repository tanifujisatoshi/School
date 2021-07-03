Rails.application.routes.draw do
  devise_for :users
  root to: "lunches#index"
  resources :lunches
    # resources :comments, only: :create
  resources :users, only: :show
end
