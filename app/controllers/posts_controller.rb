class PostsController < ApplicationController
  def index
    # Fetch the user based on the user_id parameter
    @user = User.find(params[:user_id])

    # Fetch posts associated with the user and paginate them
    @posts = @user.posts.paginate(page: params[:page], per_page: 10) # You can adjust per_page as needed
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
