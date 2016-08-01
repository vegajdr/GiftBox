class FavoritesDestroyer

  def initialize favorite, params
    @favorite, @params = favorite, params
  end

  def destroy
    if @params[:colors]
      @favorite.update color: nil
    end

    if @params[:animal]
      @favorite.update animal: nil
    end

    if @params[:season]
      @favorite.update season: nil
    end

    if @params[:restaurant]
      @favorite.update restaurant: nil
    end

    if @params[:custom]
      @favorite.update custom: nil
    end
  end

end
