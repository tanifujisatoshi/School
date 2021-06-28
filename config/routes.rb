Rails.application.routes.draw do
  devise_for :users
  get 'lunches/index'
  resources :users, only: :show
end
