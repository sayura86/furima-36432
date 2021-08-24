Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'users', to: 'items#index'
  resources :items
end
