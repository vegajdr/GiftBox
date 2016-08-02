class WishlistsController < ApplicationController

  before_action :json_format

  def index
    @wishlists = current_user.wishlists
  end

  def create
    wishlist = current_user.wishlists.create! name: params[:name]
    if params[:item]
      item = wishlist.items.create! item_params
    end
    render json: wishlist, status: :ok
  end

  def update
    wishlist = current_user.wishlists.find params[:id]
    wishlist.update approved_params
  end

  def destroy
    wishlist = Wishlist.find params[:id]
    wishlist.destroy
  end

  def friend_wishlists
    @user = search_user
    @wishlists = @user.wishlists
    if @user && (current_user.friends.include?(@user))
      render :index, status: :ok
    else
      render json: { error: "You're not authorized to access this user's profile"}
    end
  end

  private

    def approved_params
      params.permit [:name]
    end

    def item_params
      params.require(:item).permit :name, :description
    end

end
