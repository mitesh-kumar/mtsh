Rails.application.routes.draw do
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  post 'home/create_subscriber'
  post 'home/feedback_subscriber'
  get 'home/ror'
end
