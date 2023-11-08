class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      flash[:notice] = 'Success'
      redirect_to user_post_path(@post.author, @post)
    else
      flash[:alert] = 'Error.'
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @comment = Comment.new
    @user = current_user
    @post = Post.find(params[:post_id])
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
