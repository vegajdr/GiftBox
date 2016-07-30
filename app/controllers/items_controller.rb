class ItemsController < ApplicationController

  def create
    wishlist = current_user.wishlists.find params[:wishlist_id]
    wishlist.items.create! name: params[:name]
  end
end
