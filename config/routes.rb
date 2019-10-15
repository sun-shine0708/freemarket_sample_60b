Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'
  resources :products do
    member do
      get 'buy_confirmation'
    end
  end
  resources :users do
    member do
      get 'preview'
      get 'sms_confirmation'
      get 'mail_password'
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
  resources :categories do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :creditcards, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcards#show'
      post 'pay', to: 'creditcards#pay'
      post 'delete', to: 'creditcards#delete'
    end
  end

end
