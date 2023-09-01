class PostsController < ApplicationController
  def index
    # Fetch the user based on the user_id parameter
    @user = User.find(params[:user_id])

    # Fetch posts associated with the user
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end
end
