class ProfileController < ApplicationController

  def show
    @info = User.first
  end

  

end
