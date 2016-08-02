class UsersController < ApplicationController
  before_action :json_format

  def index
    @users = User.all
  end

end
