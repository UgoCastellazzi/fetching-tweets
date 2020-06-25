class TweetsController < ApplicationController
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to request.referrer
  end
end
