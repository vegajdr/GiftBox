class HolidaysUpdater

  def initialize user, params
    @user, @params = user, params
  end

  def create
    @params.keys.each do |holiday|
        @user.holidays.create!(
        name:         master_key[holiday],
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

  private

  def master_key
    { 'Christmas'     => 'Christmas',
    'Birthday'      => 'Birthday',
    'Valentines'    => "Valentine's Day",
    'NYE'           => "New Year's Eve",
    'Thanksgivings' => "Thanksgiving",
    'MothersDay'    => "Mother's Day",
    'Halloween'     => 'Halloween',
    'StPatricks'    => "St. Patrick's Day",
    'Ramadan'       => 'Ramadan',
    'Easter'        => 'Easter',
    'FathersDay'    => "Father's Day",
    'FourthofJuly'  => '4th of July',
    'Hanukkah'      => 'Hanukkah' }
  end
end
