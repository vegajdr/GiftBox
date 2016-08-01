class FavoritesController < ApplicationController

  def show
    @favorites = current_user.favorites.first
    unless @favorites
      render json: { error: "You are not authorized to access this info" }, status: :forbidden
    else
      render json: @favorites
    end
  end

end
