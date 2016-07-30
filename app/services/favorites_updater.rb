class FavoritesUpdater

  def initialize user, params
    @user, @params = user, params
  end

  def create
    if @params["colors"]
      color_create
    end

    @user.favorites.create!(
      animal:     @params["fav_animal"],
      season:     @params["fav_season"],
      restaurant: @params["fav_restaurant"],
      custom:     @params["fav_custom"],

    )

  end

  def color_create
    @user.colors.create! name: @params["colors"]
  end
end
