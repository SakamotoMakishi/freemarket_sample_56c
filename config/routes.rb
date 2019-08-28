Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#root'
  post   '/like/:item_id', to: 'likes#create' , as: 'like'
  delete '/like/:item_id', to: 'likes#destroy', as: 'unlike'
  
  resources :likes, only: :index
  resources :categories, only: :show
  resources :brands, only: :show
  resources :address_inputs
  resources :notifications, only: :index do
    collection do
      get "notifications_none"
    end
  end
  resources :items do
    resources :comments, only: [:create]
    collection  do
      get 'buy'
      get 'search'
      get 'category_search2'
      get 'category_search3'
      get 'new_modal'
    end
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end

  namespace :api do
    resources :items, only: [:new, :edit, :destroy, :create, :update],defaults:{ format: 'json' }
  end

  resources :users, only: :show do
    member do
      get 'card_add_to'
      get 'listing'
      get 'trading'
      get 'completed'
      get 'purchase'
      get 'purchased'
      get 'things'
      get 'item_message'
      get 'buyer'
    end
    collection  do
      get 'signup_page'
      get 'user_input'
      get 'sms_message'
      get 'delivary_input'
      get 'complete_page'
      get 'signout'
      get 'profile'
      get 'user_card'
      get 'plivacy_policy'
    end
  end

  resources :cards do
    member do
      get 'new', to: 'cards#new'
      get 'show', to: 'cards#show', as: "card_delete"
      post 'make', to: 'cards#make'
      get 'index', to: 'cards#index', as: "card_buy"
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
      post 'rating', to: 'cards#rating'
    end
    collection  do
      get 'regist', to: 'cards#regist'
    end
  end
  get 'user-item/:id', to: 'items#show_user_item'
end
