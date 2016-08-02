class FavoritesController < ApplicationController

  def show
    @favorites = current_user.favorites.first
    unless @favorites
      render json: { error: "You are not authorized to access this info" }, status: :forbidden
    else
      render json: @favorites
    end
  end

  def destroy
    @favorite = current_user.favorites.first
    favorites = FavoritesDestroyer.new @favorite, params
    favorites.destroy
  end

end
