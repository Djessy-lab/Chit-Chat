class PostLikesController < ApplicationController
  before_action :set_post, only: %i[new create]

  def create
    @post_like = PostLike.new
    @post_like.post = @post
    if @post_like.save
      redirect_to posts_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post_like = PostLike.find(params[:id])
    @post_like.destroy
    redirect_to posts_path(@post_like.post), status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:post])
  end
end
