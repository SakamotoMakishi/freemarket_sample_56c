Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items
  resources :categories, only: :show
  resources :brands, only: :show

  get 'users/signup_page' => 'users/signup_page'
  get 'users/user_input' => 'users/user_input'
  get 'users/sms_message' => 'users/sms_message'
  get 'users/delivary_input' => 'users/delivary_input'
  get 'users/card_input' => 'users/card_input'
  get 'users/complete_page' => 'users/complete_page'
end
