class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id), notice: 'Comment added successfully'
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    @comment.destroy
    redirect_to user_post_path(user_id: @comment.post.author.id, id: @comment.post.id),
                notice: 'Comment deleted successfully!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
