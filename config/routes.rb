Rails.application.routes.draw do

  get 'tweets', to: 'tweets#index'
  post 'tweets', to: 'tweets#create'

  post 'auth/login', to: 'authentication#authenticate'

  get 'users', to: 'users#index'
  post 'signup', to: 'users#create'
end
