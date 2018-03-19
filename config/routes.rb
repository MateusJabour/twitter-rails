Rails.application.routes.draw do

  post 'auth/login', to: 'authentication#authenticate'

  get 'tweets', to: 'tweets#getAllTweets'
  get 'tweets/:user_id', to: 'tweets#getUserTweets'
  post 'tweets', to: 'tweets#create'
  post 'tweet/:id/delete', to: 'tweets#delete'
  get 'retweet', to: 'retweets#getAllRetweets'
  get 'retweet/:user_id', to: 'retweets#getUserRetweets'
  post 'retweet/:tweet_id', to: 'retweets#retweet'

  get 'users', to: 'users#getAll'
  post 'users', to: 'users#create'
  get 'user/:id', to: 'users#getOne'

  get 'relationships', to: 'relationships#getAll'
  post 'follow/:id', to: 'relationships#follow'
  post 'unfollow/:id', to: 'relationships#unfollow'
end
