class HolidaysController < ApplicationController

  def create
    current_user.update birthday_params
    special_day_params[:special_days].each do |day|
      current_user.special_days.create! day
    end
    holiday_params[:holidays].each do |holiday|
      current_user.holidays.where(name: holiday).first_or_create!
    end

    render json: { status: "Birthday, Special Days and Holidays have been updated"}
  end



  private

    def birthday_params
      params.require(:birthday).permit(:dob_day, :dob_month, :dob_year)
    end

    def special_day_params
      params.permit(special_days:[:sd_day, :sd_month, :sd_year, :name])
    end

    def holiday_params
      params.permit(holidays:[])
    end
end
