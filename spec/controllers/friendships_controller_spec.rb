require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  it "allows users to request friends" do
    user = create :user
    friend = create :user
    sign_in user

    old_count = user.pending_friendships.count

    response = post :create, requested_friend: friend.username, username: user.username

    expect(user.pending_friendships.count).to eq old_count + 1
    expect(user.pending_friendships.last.status).to eq "pending"
  end
end
