Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new, :show, :create] do
    member do
      get 'buy_confirmation'
    end
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
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
      get 'user2'
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
