Rails.application.routes.draw do
  devise_for :users

  resources :cadastros
  resources :turmas do
    resources :alunos
  end

  get 'home/index'
  root 'home#index'
end
