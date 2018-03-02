require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  it "responds with current user's favorites" do
    favorite = create :favorite
    user = favorite.user
    sign_in user

    response = get :show

    data = JSON.parse response.body

    expect(response.status).to eq 200
    expect(data.keys).to include "color"
    expect(data.keys).to include "restaurant"
  end

  it "responds with forbidden message if current user does not own favorites" do
    favorite = create :favorite
    not_owner = create :user
    sign_in not_owner

    response = get :show
    data = JSON.parse response.body

    expect(response.status).to eq 403
    expect(data.keys).to include "error"
  end

  it "allows favorite attributes to be deleted by current user" do
    favorite = create :favorite
    user = favorite.user
    sign_in user

    old_favorite_count = user.favorites.count

    response = delete :destroy, deleted_favorite: "color"

    expect(user.favorites.count).to eq old_favorite_count
    expect(user.favorites.first.color).to eq nil
    expect(user.favorites.first.animal).to eq "Lion"
  end

  it 'allows favorite animal attributes to be deleted by current user' do
    favorite = create :favorite
    user = favorite.user
    sign_in user

    old_favorite_count = user.favorites.count

    response = delete :destroy, deleted_favorite: "animal"

    expect(user.favorites.count).to eq old_favorite_count
    expect(user.favorites.first.color).to eq "Red"
    expect(user.favorites.first.animal).to eq nil
  end

end
