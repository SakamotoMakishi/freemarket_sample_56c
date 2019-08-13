Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  
  resources :categories, only: :show
  resources :brands, only: :show
 
  
  resources :items do
    collection  do
      get 'buy'
    end
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end
  
  resources :users do
    collection  do
      get 'signup_page'
      get 'user_input'
      get 'sms_message'
      get 'delivary_input'
      get 'card_input'
      get 'complete_page'
      get 'signout'
      get 'profile'
      get 'identification'
    end
  end
  get 'user-item/:id', to: 'items#show_user_item'
end
