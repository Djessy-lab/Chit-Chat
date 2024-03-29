class PostsController < ApplicationController
  def index
    # action posts#index
    if current_user.nanny?
      @posts = current_user.posts.reverse_order
    else
      @posts = current_user.my_posts.reverse_order
    end
    # action posts#new
    @post = Post.new
    # action child_post
    @child_post = ChildPost.new
    # action post_likes#new
    @post_like = PostLike.new
    # action comments#new
    @comment = Comment.new
    # action comment_likes#new
    @comment_like = CommentLike.new
    @notifications = Notification.where(receiver: current_user).unread
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    @post.save
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(posts_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def posts_params
    params.require(:post).permit(:content, photos: [], child_ids: [])
  end
end
