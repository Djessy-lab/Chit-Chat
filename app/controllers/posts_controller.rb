class PostsController < ApplicationController
  def index
    # action posts#index
    @posts = current_user.posts
    # action posts#new
    @post = Post.new

  end
end
