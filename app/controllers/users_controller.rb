class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.return_three_most_recent_posts(3)
    @posts = @user.posts # Assuming you have a posts association on the User model
  end
end
