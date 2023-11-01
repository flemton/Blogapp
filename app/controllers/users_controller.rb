class UsersController < ApplicationController
  def index
    # For displaying all users
    @users = User.all
  end

  def show
    # For displaying a single user
  end
end
