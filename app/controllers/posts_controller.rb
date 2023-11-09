class PostsController < ApplicationController
  def index
    # For displaying all posts by a given user
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = 'Post creation failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # For displaying a single post by a user
    @post = Post.find(params[:post_id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :text)
  end
end
