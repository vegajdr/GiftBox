class WishlistsController < ApplicationController

  def index
    @wishlists = current_user.wishlists
  end

  def create
    current_user.wishlists.create! name: params[:name]
  end

  def update
    wishlist = Wishlist.find params[:id]
    wishlist.update approved_params
  end

  def destroy
    wishlist = Wishlist.find params[:id]
    wishlist.delete
  end


  private

    def approved_params
      params.permit [:name]
    end
end
