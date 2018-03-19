class TweetsController < ApplicationController
  def getAllTweets
    id_list = current_user.followings.ids << current_user.id
    tweets = Tweet.where(user_id: id_list).order('created_at DESC')
    json_response(tweets)
  end

  def getUserTweets
    tweets = Tweet.where(user_id: params[:user_id]).order('created_at DESC')
    json_response(tweets)
  end

  def create
    tweet = current_user.tweets.create!(tweet_params)
    json_response(tweet, :created)
  end

  def delete
    tweet = Tweet.find_by_id(params[:id])
    if tweet.destroy
      json_response({ id: params[:id] })
    end
  end

  private

  def tweet_params
    params.permit(:text)
  end
end
