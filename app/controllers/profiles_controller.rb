class ProfilesController < ApplicationController

  def profile
    @user = User.find_by username: params[:username]
    if @user == current_user
      render 'profile.json.jbuilder', status: :ok
    else
      render json: { status: 'Not Authorized'}
    end
  end

  def login
    @user = current_user
    if @user
      render json: { status: 'Valid User'}
    else
      render json: { status: 'Not Authorized'}
    end
  end

  def create
    #create Profile page
  end



end
