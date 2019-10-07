Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: [:index]
  resources :users do
    member do
      get 'preview'
    end
  end
end
