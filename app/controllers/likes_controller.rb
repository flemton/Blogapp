class LikesController < ApplicationController
  def create
    @like = Like.new
    @post = Post.find(params[:post_id])
    @user = current_user
    @like.post = @post
    @like.author = current_user
    if @like.save
      flash[:notice] = 'Liked.'
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Error, please try again.'
      render :new, status: :unprocessable_entity
    end
  end
end
