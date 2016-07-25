class ProfilesController < ApplicationController
  before_action :json_format

  # skip_before_action :verify_authenticity_token
  # skip_before_action :authenticate_user!, only: [:login, :profile]


  def show
    @accepted_friend = current_user.friends.include? search_user
    @user = search_user
    if @user
      render :show, status: :ok
    else
      user_not_found_response
    end
  end

  def create
    request = JSON.parse params["ProfileData"]

    current_user.update(
      dob_day:      request["birthday"]["dob_day"],
      dob_month:    request["birthday"]["dob_month"],
      dob_year:     request["birthday"]["dob_year"]
    )
    request["holidays"].keys.each do |holiday|
      current_user.holidays.create!(
      name: holiday,
      preset?: true
    )
    end
  end

  def update
    current_user.update allowed_params
    #create Profile page
  end

  private

    def allowed_params
      params.permit(:first_name, :last_name, :dob_day, :dob_month, :dob_year)
    end

    def search_user
      User.find_by username: params[:username]
    end

end
