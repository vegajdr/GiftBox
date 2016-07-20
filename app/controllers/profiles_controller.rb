class ProfilesController < ApplicationController
  before_action :json_format

  # skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:login, :profile]


  def show
    # TODO Respond according to authentication
    @accepted_friend = current_user.friends.include? search_user
    # @friendship_status = friendship_accepted?
    @user = search_user
    # if @user == current_user
    #   render :profile, status: :ok
    # else
    #   render json: { error: 'Not Authorized'}, status: :unauthorized
    # end
  end

  def create
    # TODO Add response
    user = current_user
    user.update allowed_params
    #create Profile page
  end

  def update
    # TODO Add response
    user = current_user
    user.update allowed_params
    #create Profile page
  end


  def login
    @user = current_user
    if @user
      render json: { status: 'Valid User'}
    else
      render json: { error: 'Not Authorized'}, status: :unauthorized
    end
  end


  def test
    binding.pry
  end

  private

    # def json_format
    #   request.format = :json
    # end

    def allowed_params
      params.permit(:first_name, :last_name, :dob_day, :dob_month, :dob_year)
    end

    def search_user
      User.find_by username: params[:username]
    end

end
