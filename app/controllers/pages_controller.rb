class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @tweets = @user.find_voted_items
  end
end
