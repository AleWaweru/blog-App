class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.return_three_most_recent_posts(3)
    @posts = @user.posts.includes(:author) # Include author information to further optimize
  end
end
