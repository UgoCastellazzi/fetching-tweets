class TweetsController < ApplicationController
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to request.referrer
  end

  def like
    @user = current_user
    @tweet = Tweet.find(params[:id])
    @tweet.liked_by @user
    redirect_to request.referrer
  end
end
