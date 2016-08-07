class BirthdayUpdater

  def initialize user, params
    @user = user
    @params = params
  end

  def create
    @user.update!(
      dob_day:      @params['dob_day'],
      dob_month:    @params['dob_month'],
      dob_year:     @params['dob_year']
    )
  end
  
end
