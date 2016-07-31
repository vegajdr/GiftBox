class ItemsController < ApplicationController

  def create
    wishlist = current_user.wishlists.find params[:wishlist_id]
    unless wishlist
      unauthorized_response
    else
      item = wishlist.items.create! name: params[:name]
      render json: item, status: :ok
    end
  end

  def update
    item = current_user.items.find params[:id]
    unless item
      unauthorized_response
    else
      item.update approved_params
      render json: item, status: :ok
    end
  end

  def destroy
    item = current_user.items.find params[:id]
    unless item
      unauthorized_response
    else
      item.destroy
      render json: item, status: :ok
    end
  end


  private

    def approved_params
      params.permit :name
    end

    def unauthorized_response
      render json: { error: "You're not authorized to update this record" }, status: :forbidden
    end
end
