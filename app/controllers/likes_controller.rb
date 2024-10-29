class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    tweet.like(current_user) unless tweet.liked?(current_user)
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.unlike(current_user) if tweet.liked?(current_user)
    redirect_to root_path
  end
end
