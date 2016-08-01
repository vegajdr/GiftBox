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

end
