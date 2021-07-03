Rails.application.routes.draw do
  devise_for :users
  root to: "lunches#index"
  resources :lunches do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
