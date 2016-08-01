class FavoritesUpdater

  def initialize user, params
    @user, @params = user, params
  end

  def create
    @user.favorites.create!(
      color:      @params[:colors],
      animal:     @params[:fav_animal],
      season:     @params[:fav_season],
      restaurant: @params[:fav_restaurant],
      custom:     @params[:fav_custom],
    )
  end

end
