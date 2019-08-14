Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  
  resources :categories, only: :show
  resources :brands, only: :show

  resources :address_inputs

  
  resources :items do
    collection  do
      get 'buy'
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
    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  get 'user-item/:id', to: 'items#show_user_item'
  delete 'user-item/:id' => 'items#destroy'
end
