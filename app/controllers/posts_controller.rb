class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author)
      .includes(:comments)
      .where(author: params[:user_id])
      .order(created_at: :asc)

    @author = @posts.first.author
  end

  def show
    @post = Post.find(params[:id])
    @current_user = User.first
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.comments_counter = 0 # Set the initial value for comments_counter
    @post.likes_counter = 0 # Set the initial value for likes_counter

    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post created successfully!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
