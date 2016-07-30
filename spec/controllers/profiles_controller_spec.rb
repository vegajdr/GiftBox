require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  render_views

  it "responds with user profile information" do
    user = create :user
    sign_in user

    response = get :show, username: user.username

    response = JSON.parse response.body

    expect(response['user']['first_name']).to eq user.first_name
    expect(response['user']['last_name']).to eq user.last_name
  end

  it "allows to update current user's profile with birthday" do
    user = create :user
    sign_in user

    response = post :create, birthday: { dob_day: "01", dob_month: "10", dob_year: "1987" }

    user.reload

    expect(user.dob_day).to eq "01"
    expect(user.dob_month).to eq "10"
    expect(user.dob_year).to eq "1987"
  end

  it "allows to add special day to current user's profile" do
    user = create :user
    sign_in user

    response = post :create, specialDay: { sd_day: "01", sd_month: "10", sd_year: "1987" }

    expect(user.special_days.first.sd_day).to eq "01"
    expect(user.special_days.first.sd_month).to eq "10"
    expect(user.special_days.first.sd_year).to eq "1987"
  end

  it "allows to add holidays to current use's profile" do
    user = create :user
    sign_in user

    response = post :create, holidays: { Christmas: true, Hannukah: true }

    expect(user.holidays.count).to eq 2
    expect(user.holidays.last.name).to eq "Hannukah"
  end

  it 'allows to add interets to current user profile' do
    user = create :user
    sign_in user

    response = post :create, interests: { movies: true }

    expect(user.interests.first.name).to eq "Movies & Film"
  end

  it "allows to add favorites to current user's profile" do
    user = create :user
    sign_in user

    old_favorite_count = user.favorites.count

    response = post :create, favorites: {
      colors:         "Purple",
      fav_animal:     "Bears",
      fav_season:     "Spring",
      fav_restaurant: "Arby's",
      fav_custom:     "I like turtles"
    }

    expect(user.favorites.count).to eq old_favorite_count + 1
    expect(user.colors).to include(user.colors.find_by name: "Purple")
    expect(user.favorites.first.animal).to eq "Bears"
    expect(user.favorites.first.season).to eq "Spring"
    expect(user.favorites.first.restaurant).to eq "Arby's"
    expect(user.favorites.first.custom).to eq "I like turtles"
  end



end
