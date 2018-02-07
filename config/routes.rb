Rails.application.routes.draw do

  get 'tweets', to: 'tweets#index'
  post 'tweets', to: 'tweets#create'

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
