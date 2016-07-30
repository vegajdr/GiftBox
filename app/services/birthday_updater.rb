class BirthdayUpdater

  def initialize user, params
    @user, @params = user, params
  end

  def update
    @user.update!(
      dob_day:      @params["dob_day"],
      dob_month:    @params["dob_month"],
      dob_year:     @params["dob_year"]
    )
  end

end
