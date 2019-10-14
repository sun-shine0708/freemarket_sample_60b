Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  resources :products, only: [:index, :new, :show, :create]
  resources :users do
    member do
      get 'preview'
      get 'sms_confirmation'
      get 'mail_password'
    end
    collection do
      get 'logout'
    end
  end
  resources :signups do
    collection do
      get 'user1'
      post 'user2'
    end
  end
  resources :streetaddresses, only: [:new, :create]
  resources :creditcards, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcards#show'
      post 'pay', to: 'creditcards#pay'
      post 'delete', to: 'creditcards#delete'
    end
  end
  resources :categories

end
