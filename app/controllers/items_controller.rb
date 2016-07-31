class ItemsController < ApplicationController

  def create
    wishlist = current_user.wishlists.find params[:wishlist_id]
    unless wishlist
      render json: { error: "You're not authorized to access this wishlist" }, status: :forbidden
    else
      wishlist.items.create! name: params[:name]
      render json: { status: "Your wishlist has been created" }, status: :ok
    end
  end

  def update
    item = current_user.items.find params[:id]
    unless item
      render json: { error: "You're not authorized to update this item" }, status: :forbidden
    else
      item.update approved_params
      render json: { status: 'Item has been updated' }, status: :ok
    end
  end

  def destroy
    item = current_user.items.find params[:id]
    unless item
      render json: { error: "You're not authorized to updated this item" }, status: :forbidden
    else
      item.destroy
      render json: { status: 'Item has been deleted' }, status: :ok
    end
  end


  private

    def approved_params
      params.permit :name
    end
end
