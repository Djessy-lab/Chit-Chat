class PostsController < ApplicationController
  def index
    # action posts#index
    if current_user.nanny?
      @posts = current_user.posts
    else
      @posts = current_user.my_posts
    end
    # action posts#new
    @post = Post.new
    # action post_likes#new
    @post_like = PostLike.new
    # action comments#new
    @comment = Comment.new
    # action comment_likes#new
    @comment_like = CommentLike.new
  end
end
