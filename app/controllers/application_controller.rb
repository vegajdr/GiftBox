class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :authenticate_user!


  def json_format
    request.format = :json
  end

  def user_not_found_response
    render json: { error: "User not found"}
  end
end
