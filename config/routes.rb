Rails.application.routes.draw do
  devise_for :users

  resources :cadastros
  resources :users, except: :create
  post 'create_user' => 'users#create', as: :create_user

  get 'home/index'
  root 'home#index'
end
