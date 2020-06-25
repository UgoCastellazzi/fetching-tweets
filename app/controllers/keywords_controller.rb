class KeywordsController < ApplicationController
  before_action :find_keyword, only: [ :tweets]

  def index
    @keywords = Keyword.all
    @keyword = Keyword.new
  end

  def new
    @keyword = Keyword.new
  end

  def tweets
    @tweets = @keyword.tweets
  end

  def refresh_tweets
    @keyword = Keyword.find(params[:id])
    FetchingTweetsJob.perform_now(@keyword)
    redirect_to tweets_keyword_path(@keyword)
  end

  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.save
    FetchingTweetsJob.perform_now(@keyword)
    redirect_to keywords_path
  end

  def destroy
    @keyword = Keyword.find(params[:id])
    @keyword.destroy
    redirect_to keywords_path
  end

  private

  def keyword_params
    params.require(:keyword).permit(:title)
  end

  def find_keyword
    @keyword = Keyword.find(params[:id])
  end

end
