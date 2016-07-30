class HolidaysUpdater

  def initialize user, params
    @user, @params = user, params
  end

  def create
    @params.keys.each do |holiday|
        @user.holidays.create!(
        name:         holiday,
        preset?:      true
      )
      end

    if @params["Custom"]
      @user.holidays.create!(
        name:         @params["Custom"],
        preset?:      false
      )
    end
  end
end
