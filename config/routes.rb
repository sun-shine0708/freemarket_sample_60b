Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index]
  resources :users do
    resources :streetaddresses, only: [:new, :create]
    member do
      get 'preview'
    end
  end
  resources :signups do
    collection do
      get 'user1'
      get 'user2'
    end
  end
end
