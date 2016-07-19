class ProfilesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:login]
  skip_before_action :authenticate_user!, only: [:login]

  def profile
    @user = User.find_by username: params[:username]
    if @user == current_user
      render :profile, status: :ok
    else
      render json: { status: 'Not Authorized'}
    end
  end

  def login
    @user = current_user
    if @user
      render json: { status: 'Valid User'}
    else
      render json: { status: 'Not Authorized'}, status: :unauthorized
    end
  end

  def create
    #create Profile page
  end

  def test

  end



end
