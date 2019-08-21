Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sns/sign_up', to: 'users/registrations#sns', as: :new_user_registration_sns
  end

  root 'items#root'
  
  resources :categories, only: :show
  resources :brands, only: :show

  resources :address_inputs

  
  resources :items do
    collection  do
      get 'buy'
      get 'search'
      get 'category_search2'
      get 'category_search3'
    end
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end

  resources :users, only: :show do
    collection  do
      get 'signup_page'
      get 'user_input'
      get 'sms_message'
      get 'delivary_input'
      get 'complete_page'
      get 'signout'
      get 'profile'
      get 'user_card'
      get 'card_add_to'
      get 'plivacy_policy'
    end
  end

  resources :cards do
    collection  do
      get 'regist', to: 'cards#regist'
    end
    member do
      get 'new', to: 'cards#new'
      get 'show', to: 'cards#show'
      post 'make', to: 'cards#make'
      get 'index', to: 'cards#index'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  get 'user-item/:id', to: 'items#show_user_item'
end
