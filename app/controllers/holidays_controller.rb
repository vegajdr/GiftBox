class HolidaysController < ApplicationController

  def index
    @holidays = current_user.holidays
    render json: @holidays
  end

end
