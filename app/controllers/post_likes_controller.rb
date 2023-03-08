class PostLikesController < ApplicationController
  before_action :set_post, only: %i[create]

  def create
    @post_like = PostLike.new
    @post_like.post = @post
    @post_like.user = current_user
    @post_like.save
    redirect_to posts_path
  end

  def destroy
    @post_like = PostLike.find(params[:id])
    @post_like.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
