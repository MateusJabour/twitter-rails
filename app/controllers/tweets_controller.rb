class TweetsController < ApplicationController
  def index
    @tweets = current_user.tweets
    json_response(@tweets)
  end

  def create
    @tweet = current_user.tweets.create!(tweet_params)
    json_response(@tweet, :created)
  end

  private

  def tweet_params
    params.permit(:text)
  end
end
