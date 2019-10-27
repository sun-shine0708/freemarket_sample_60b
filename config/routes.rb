Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'products#index'

  resources :users, only: [:show] do
    member do
      get 'profile'
      get 'address'
      get 'mail_password'
      get 'preview'
      get 'sms_confirmation'
      get 'logout'
    end
  end

  resources :signups, only: [:new, :create] do
    collection do
      get 'user1'
      post 'user2'
      post 'pay', to: 'signups#pay'
    end
  end

  resources :streetaddresses, only: [:new, :create]

  resources :creditcards, only: [:new] do
    collection do
      get 'show', to: 'creditcards#show'
      post 'pay', to: 'creditcards#pay'
      delete 'delete', to: 'creditcards#delete'
    end
  end

  resources :products do
    member do
      get 'buy_confirmation'
      post 'onetimebuy'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      match 'search' => 'products#search', via: [:get, :post]
    end
    resources :creditcards, except: [:index, :new, :create, :edit, :show, :update, :destroy] do
      collection do
        post 'buy', to: 'creditcards#buy'
      end
    end
  end

  resources :categories , only: [:index, :show]do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  post   '/like/:product_id' => 'likes#like',   as: 'like'
  delete '/like/:product_id' => 'likes#unlike', as: 'unlike'
end
