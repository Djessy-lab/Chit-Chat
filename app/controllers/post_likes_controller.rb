class PostLikesController < ApplicationController
  before_action :set_post, only: %i[create]

  def create
    @post_like = PostLike.new
    @post_like.post = @post
    @post_like.user = current_user
    @post_like.save
    @comment_like = CommentLike.new
    @post_like = PostLike.new
    @comment = Comment.new
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.turbo_stream
    end
  end

  def destroy
    @post_like = PostLike.find(params[:id])
    @post = @post_like.post
    @post_like.destroy
    @comment_like = CommentLike.new
    @post_like = PostLike.new
    @comment = Comment.new
    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other }
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
