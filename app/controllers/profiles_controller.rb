class ProfilesController < ApplicationController
  before_action :json_format

  def show
    @accepted_friend = current_user.friends.include? search_user
    @user = current_user
    if @user || @accepted_friend
      render :show, status: :ok
    else
      render json: { error: "You're not authorized to access this user's profile"}
    end
  end

  def create
    if params["birthday"]
      birthday = BirthdayUpdater.new current_user, params["birthday"]
      birthday.update
    end

    if params["specialDay"]
      special_days = SpecialDayUpdater.new current_user, params['specialDay']
      special_days.create
    end

    if params["holidays"]
      holidays = HolidaysUpdater.new current_user, params["holidays"]
      holidays.create
    end

    if params["interests"]
      interests = InterestUpdater.new current_user, params['interests']
      interests.create
    end

    if params["favorites"]
      favorites = FavoritesUpdater.new current_user, params["favorites"]
      favorites.create
    end
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
      render json: { error: "You're not authorized to access this user's profile"}
    end
  end

  private

    def allowed_params
      params.permit(:first_name, :last_name, :dob_day, :dob_month, :dob_year)
    end


end
