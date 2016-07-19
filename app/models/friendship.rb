class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def self.exists? user, friend
    if Friendship.where(user_id: user.id, friend_id: friend.id).first
      return true
    end
      return false
  end

  def self.request user, friend
    unless Friendship.exists? user, friend
      Friendship.create! user_id: user.id, friend_id: friend.id, status: 'pending'
      Friendship.create! user_id: friend.id, friend_id: user.id, status: 'requested'
    end
  end

end
