class UsersController < ApplicationController
  before_action :json_format

  def index
    @users = User.all
  end

  def not_friend
    @user = search_user
    if @user
      render :not_friend, status: :ok
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

end
