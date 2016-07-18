class ProfileController < ApplicationController

  def profile
    user = current_user
    @info = user
  end

  def test
    binding.pry
  end



end
