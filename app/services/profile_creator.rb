class ProfileCreator

  def initialize user, params
    @user, @params = user, params
  end

  def update
    if @params["birthday"]
        birthday = BirthdayUpdater.new current_user, @params["birthday"]
        birthday.update
      end

      if @params["specialDay"]
        special_days = SpecialDayUpdater.new current_user, @params['specialDay']
        special_days.create
      end

      if @params["holidays"]
        holidays = HolidaysUpdater.new current_user, @params["holidays"]
        holidays.create
      end

      if @params["interests"]
        interests = InterestUpdater.new current_user, @params['interests']
        interests.update
      end
    end

end
