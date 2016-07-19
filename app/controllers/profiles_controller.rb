class ProfilesController < ApplicationController
  before_filter :json_format

  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:login, :profile]


  def profile
    @user = User.find_by username: params[:username]
    if @user == current_user
      render :profile, status: :ok
    else
      render json: { error: 'Not Authorized'}, status: :unauthorized
    end
  end

  def login
    @user = current_user
    if @user
      render json: { status: 'Valid User'}
    else
      render json: { error: 'Not Authorized'}, status: :unauthorized
    end
  end

  def create
    binding.pry
    #create Profile page
  end

  def test

  end

  private

    def json_format
      request.format = :json
    end


end
