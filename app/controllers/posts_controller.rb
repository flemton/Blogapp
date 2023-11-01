class PostsController < ApplicationController
  def index
    # For displaying all posts by a given user
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    # For displaying a single post by a user
  end
end
