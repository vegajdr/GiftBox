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

  it "creates IdeaBox when user is accepted as friend" do
    user = create :user
    sign_in user
    friend = create :user

    Friendship.request user, friend

    old_ideabox_count = user.ideaboxes.count

    response = post :accept, accepted_friend: friend.username

    expect(user.ideaboxes.count).to eq old_ideabox_count + 1
    expect(user.ideaboxes.first.friend).to eq friend
  end

  it "allows users to remove friends" do
    user = create :user
    sign_in user
    friend = create :user

    Friendship.request user, friend
    Friendship.accept user, friend
    old_friends_count = user.friends.count

    response = delete :destroy, removed_friend: friend.username, username: user.username

    expect(user.friends.count).to eq old_friends_count - 1
  end

  it 'allows users to deny friend requests' do
    user = create :user
    sign_in user
    friend = create :user

    Friendship.request user, friend

  end
end
