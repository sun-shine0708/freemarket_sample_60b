Rails.application.routes.draw do
  get 'creditcards/new'

  get 'creditcards/show'

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
end
