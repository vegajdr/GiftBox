class FavoritesDestroyer

  def initialize favorite, params
    @favorite = favorite
    @params = params
  end

  def destroy
    attribute = @params[:deleted_favorite].to_sym
    @favorite.update attribute => nil
  end

end
