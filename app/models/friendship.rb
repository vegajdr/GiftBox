class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"


  def self.request user, friend
    unless Friendship.where(user_id: user.id, friend_id: friend.id).exists?
      Friendship.create! user: user, friend: friend, status: 'pending'
      Friendship.create! user: friend, friend: user, status: 'requested'
    end
  end

  def self.accept user, friend
    u = Friendship.where( user_id: user.id, friend_id: friend.id ).first.update status: "accepted"
    f = Friendship.where( user_id: friend.id, friend_id: user.id ).first.update status: "accepted"
  end

end
