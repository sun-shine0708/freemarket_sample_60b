Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :show]
  resources :users do
    resources :streetaddresses, only: [:new, :create]
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
      get 'user2'
    end
  end

  resources :categories

  resources :creditcards, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcards#show'
      post 'pay', to: 'creditcards#pay'
      post 'delete', to: 'creditcards#delete'
    end
  end

end
