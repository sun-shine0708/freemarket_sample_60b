Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index]
  resources :users
end
