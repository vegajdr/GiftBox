class SpecialDayUpdater

  def initialize user, params
    @user = user
    @params = params
  end

  def create
    @user.special_days.create!(
      sd_day:       @params['sd_day'],
      sd_month:     @params['sd_month'],
      sd_year:      @params['sd_year'],
      name:         @params['sd_name']
    )
  end

end
