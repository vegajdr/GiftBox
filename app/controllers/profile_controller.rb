class ProfileController < ApplicationController

  def profile
    user = current_user
    @info = user
  end

  def test
    @user = current_user
    if @user
      render 'test.json.jbuilder', status: :ok
    else
      render json: { status: 'Not Authorized'}
    end

  end



end
