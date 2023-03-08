class CommentLikesController < ApplicationController
  before_action :set_comment, only: %i[new create]

  def create
    @comment_like = CommentLike.new
    @comment_like.comment = @comment
    @comment_like.user = current_user
    @comment_like.save
    redirect_to posts_path
  end

  def destroy
    @comment_like = CommentLike.find(params[:id])
    @comment_like.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
