class CommentLikesController < ApplicationController
  before_action :set_comment, only: %i[new create]

  def create
    @comment_like = CommentLike.new
    @comment_like.comment = @comment
    @comment_like.save
    redirect_to comments_path(@comment)
  end

  def destroy
    @comment_like = CommentLike.find(params[:id])
    @comment_like.destroy
    redirect_to comments_path(@comment_like.comment), status: :see_other
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment])
  end
end
