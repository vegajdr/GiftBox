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
    expect(friend.requested_friendships.last.status).to eq "requested"
  end

  it "allows users to accept friend requests" do
    user = create :user
    sign_in user
    friend = create :user

    Friendship.request user, friend

    old_ac_count = user.accepted_friendships.count
    old_friend_count = user.friends.count

    response = post :accept, accepted_friend: friend.username, username: user.username

    expect(user.accepted_friendships.count).to eq old_ac_count + 1
    expect(user.friends.count).to eq old_friend_count + 1
    expect(user.friends).to include friend
  end
end
