class ProfileController < ApplicationController

  def profile
    user = current_user
    @info = user
  end
# TODO This needs to be removed before final day
  def test
    @user = current_user
    if @user
      render 'test.json.jbuilder', status: :ok
    else
      render json: { status: 'Not Authorized'}
    end
  end

  def login
    @user = current_user
    if @user
      # FIXME Needs to be changed to actual proper view
      render 'test.json.jbuilder', status: :ok
    else
      render json: { status: 'Not Authorized'}
    end
  end



end
