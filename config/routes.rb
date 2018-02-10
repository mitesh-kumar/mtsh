Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  post 'home/create_subscriber'
  post 'home/feedback_subscriber'
  get 'home/ror'
  post 'home/create_quote'
  get 'home/contact'
  post 'home/create_contact'
  get 'home/about'
  get '/terms_condition' => 'home#terms_condition'
  get '/privacy_policy' => 'home#privacy_policy'
  get 'home/java'
  get 'home/unsubscribe'
  patch 'home/update_subscription'
end
