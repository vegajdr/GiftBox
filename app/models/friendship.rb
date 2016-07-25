class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"


  def self.request user, friend
    unless Friendship.where( user: user, friend: friend ).exists?
      Friendship.create! user: user, friend: friend, status: 'pending'
      Friendship.create! user: friend, friend: user, status: 'requested'
    end
  end

  def self.accept user, friend
    Friendship.where( user: user, friend: friend ).first.update status: "accepted"
    Friendship.where( user: friend, friend: user ).first.update status: "accepted"
  end

  def self.remove_friend user, friend
    Friendship.where( user: user, friend: friend ).first.delete
    Friendship.where( user: friend, friend: user ).first.delete
  end

  def self.friend_create user, friend
    user.accepted_friendships.create! friend: friend
    friend.accepted_friendships.create! friend: user
  end



end
