Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new]
  resources :users do
    member do
      get 'preview'
    end
  end
end
