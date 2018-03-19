class RetweetsController < ApplicationController
  def retweet
    existing_retweet = Retweet.where(tweet_id: params[:tweet_id], user_id: current_user.id).first
    if existing_retweet
      if existing_retweet.destroy
        json_response({ action: 'delete', id: existing_retweet.id, tweet_id: params[:tweet_id] })
      end
    else
      retweet = Retweet.new()
      retweet.tweet_id = params[:tweet_id]
      retweet.user_id = current_user.id

      retweet_tweet = Tweet.where(id: params[:tweet_id]).first
      if retweet.save
        json_response({ action: 'create', retweet: retweet, retweet_tweet: retweet_tweet })
      end
    end
  end

  def getAllRetweets
    id_list = current_user.followings.ids << current_user.id
    retweets = Retweet.where(user_id: id_list).order('created_at DESC')
    retweets_tweets = Tweet.where(id: Retweet.where(user_id: id_list).pluck(:tweet_id))
    json_response({ retweets: retweets, retweet_tweets: retweets_tweets })
  end

  def getUserRetweets
    retweets = Retweet.where(user_id: params[:user_id]).order('created_at DESC')
    retweets_tweets = Tweet.where(id: Retweet.where(user_id: params[:user_id]).pluck(:tweet_id))
    json_response({ retweets: retweets, retweet_tweets: retweets_tweets })
  end
end
