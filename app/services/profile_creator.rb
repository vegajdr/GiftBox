class ProfileCreator
  def initialize user, params
    @user = user
    @params = params
  end

  def create
    if @params[:birthday]
      birthday = BirthdayUpdater.new @user, @params[:birthday]
      birthday.create
    end

    if @params[:specialDay]
      special_days = SpecialDayUpdater.new @user, @params[:specialDay]
      special_days.create
    end

    if @params[:holidays]
      holidays = HolidaysUpdater.new @user, @params[:holidays]
      holidays.create
    end

    if @params[:interests]
      interests = InterestUpdater.new @user, @params[:interests]
      interests.create
    end

    if @params[:favorites]
      favorites = FavoritesUpdater.new @user, @params[:favorites]
      favorites.create
    end
  end
end
