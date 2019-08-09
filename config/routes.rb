Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items
  resources :categories, only: :show
  resources :brands, only: :show


  resources :users do
    collection  do
      get 'signup_page'
      get 'user_input'
      get 'sms_message'
      get 'delivary_input'
      get 'card_input'
      get 'complete_page'
      get 'signout'
    end
  end
end
