Rails.application.routes.draw do
  devise_for :users
  get 'lunches/index'
end
