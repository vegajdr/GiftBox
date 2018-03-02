require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  it "allows user to create item under existing wishlist" do
    wishlist = create :wishlist
    user = wishlist.user
    binding.pry
    sign_in user

    old_items_count = user.items.count

    response = post :create, wishlist_id: wishlist.id, item: { name: "Great Toy" }

    expect(user.items.count).to eq old_items_count + 1
    expect(wishlist.items.first.name).to eq "Great Toy"
  end

  it "allows user to update existing item on wishlist" do
    item = create :item
    wishlist = item.wishlist
    user = wishlist.user
    sign_in user

    old_items_count = user.items.count

    response = patch :update, wishlist_id: wishlist.id, id: item.id, item: { name: "Updated Name" }

    expect(user.items.count).to eq old_items_count
    expect(user.items.last.name).to eq "Updated Name"
    expect(response.status).to eq 200
  end

  it "allows user to delete item on wishlist" do
    item = create :item
    wishlist = item.wishlist
    user = wishlist.user
    sign_in user

    old_items_count = user.items.count

    response = delete :destroy, wishlist_id: wishlist.id, id: item.id

    expect(user.items.count).to eq old_items_count - 1
    expect(response.status).to eq 200
  end

  pending "tags items with existing user interest"

end
