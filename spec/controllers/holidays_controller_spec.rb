require 'rails_helper'

RSpec.describe HolidaysController, type: :controller do

  it 'allows user to delete holiday' do
    user = create :user
    sign_in user

    holiday = user.holidays.create! name: "Thanksgivings", season: "Fall", preset?: true

    old_holiday_count = user.holidays.count

    response = delete :destroy, id: holiday.id

    expect(user.holidays.count).to eq old_holiday_count - 1
  end

end
