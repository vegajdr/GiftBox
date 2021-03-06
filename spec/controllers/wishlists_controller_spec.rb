require 'rails_helper'

RSpec.describe WishlistsController, type: :controller do

  it "allows users to create wishlist" do
    user = user_create
    old_wishlist_count = user.wishlists.count
    response = post :create, name: "First Wishlist", username: user.username

    expect(user.wishlists.count).to eq old_wishlist_count + 1
    expect(user.wishlists.first.name).to eq "First Wishlist"
  end

  it "allows users to edit wishlist" do
    user = user_create
    wishlist = user.wishlists.create! name: "Not Modified"
    old_wishlist_count = user.wishlists.count

    response = patch :update, name: "Modified", username: user.username, id: wishlist.id

    expect(user.wishlists.count).to eq old_wishlist_count
    expect(user.wishlists.first.name).to eq "Modified"
  end

  it "allows users to delete wishlist" do
    user = user_create
    wishlist = user.wishlists.create! name: "Still Here!"
    old_wishlist_count = user.wishlists.count

    response = delete :destroy, username: user.username, id: wishlist.id

    expect(user.wishlists.count).to eq old_wishlist_count - 1
  end

  it "allows users to create wishlist with item" do
    user = user_create
    old_wishlist_count = user.wishlists.count
    old_items_count = user.items.count

    response = post :create, name: "First Wishlist", item: { name: "Toy", interest: 1, holiday: 1, description: "Random description"}

    expect(user.wishlists.count).to eq old_wishlist_count + 1
    expect(user.wishlists.first.name).to eq "First Wishlist"
    expect(user.items.count).to eq old_items_count + 1
    expect(user.items.last.name).to eq "Toy"
  end





  def user_create
    user = create :user
    sign_in user
    user
  end
end
