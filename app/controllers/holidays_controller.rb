class HolidaysController < ApplicationController
  def index
    @holidays = current_user.holidays
    render json: @holidays
  end

  def destroy
    holiday = current_user.holidays.find params[:id]
    if holiday
      holiday.destroy
      render json: { status: "You have deleted the #{holiday.name} holiday" }, status: :ok
    else
      render json: { error: 'You are not allowed to modify this record' }, status: :forbidden
    end
  end
end
