class CommentsController < ApplicationController
  before_action :set_comments, only: %i[update destroy]

  def create
    posts_index
    @comment = Comment.new(comments_params)
    @post = Post.find(params[:post_id])
    @post_like = PostLike.new
    @new_comment = Comment.new
    @comment.post = @post
    @comment.user = current_user
    @comment_like = CommentLike.new
    if @comment.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.turbo_stream
      end
    else
      render "posts/index", status: :unprocessable_entity
    end
  end

  # def update
  #   @comment.update(comments_params)
  #   redirect_to comments_path
  # end

  def destroy
    @comment.destroy
    redirect_to posts_path
  end

  private

  def set_comments
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:content)
  end

  def posts_index
    if current_user.nanny?
      @posts = current_user.posts
    else
      @posts = current_user.my_posts
    end
    @post = Post.new
    @post_like = PostLike.new
    @comment = Comment.new
    @comment_like = CommentLike.new
  end
end
