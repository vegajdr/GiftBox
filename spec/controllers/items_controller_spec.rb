require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  it "allows user to create item under existing wishlist" do
    wishlist = create :wishlist
    user = wishlist.user
    sign_in user

    old_items_count = user.items.count

    response = post :create, name: "Great Toy", wishlist_id: wishlist.id

    expect(user.items.count).to eq old_items_count + 1
    expect(wishlist.items.first.name).to eq "Great Toy"
  end

end
