Rails.application.routes.draw do

  post 'auth/login', to: 'authentication#authenticate'

  get 'tweets', to: 'tweets#getAll'
  post 'tweets', to: 'tweets#create'
  post 'tweet/:id/delete', to: 'tweets#delete'

  get 'users', to: 'users#getAll'
  post 'users', to: 'users#create'
  get 'user/:id', to: 'users#getOne'

  get 'relationships', to: 'relationships#getAll'
  post 'follow/:id', to: 'relationships#follow'
  post 'unfollow/:id', to: 'relationships#unfollow'
end
