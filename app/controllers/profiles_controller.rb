class ProfilesController < ApplicationController
  before_action :json_format
  # skip_before_action :authenticate_user!, only: [:create]

  def show
    @accepted_friend = current_user.friends.include? search_user
    @user = current_user
    if @user || @accepted_friend
      render :show, status: :ok
    else
      render json: { error: "You're not authorized to access this user's profile" }
    end
  end

  def create
    profile_creation = ProfileCreator.new current_user, params
    profile_creation.create

    render json: { status: 'Profile has been updated' }
  end

  def update
    current_user.update allowed_params
  end

  def friend_profile
    @accepted_friend = current_user.friends.include? search_user
    @user = search_user
    if @user && @accepted_friend
      render :show, status: :ok
    elsif @user == current_user
      render :show, status: :ok
    else
      render json: { error: "You're not authorized to access this user's profile" }
    end
  end

  private

    def allowed_params
      params.permit(:first_name, :last_name, :dob_day, :dob_month, :dob_year)
    end


end
