class HolidaysController < ApplicationController

  def index
    @holidays = current_user.holidays
    render json: @holidays
  end

  def destroy
    holiday = current_user.holidays.find params[:id]
    unless holiday
      render json: { error: "You are not allowed to modify this record" }, status: :forbidden
    else
      holiday.destroy
      render json: { status: "You have deleted the #{holiday.name} holiday" }, status: :ok
    end
  end

end
