Rails.application.routes.draw do
  devise_for :users

  resources :cadastros

  get 'home/index'
  root 'home#index'
end
