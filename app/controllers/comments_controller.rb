class CommentsController < ApplicationController
  before_action :set_comments, only: %i[update destroy]

  def create
    @comment = Comment.new(comments_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @user = User.find(params[:user_id])
    @comment.user = @user
    @comment.save
  end

  def update
    @comment.update(comments_params)
    redirect_to comments_path
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, status: :see_other
  end

  private

  def set_comments
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
