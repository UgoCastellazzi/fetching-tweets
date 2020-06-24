class KeywordsController < ApplicationController

  def index
    @keywords = Keyword.all
    @keyword = Keyword.new
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.save
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

end
