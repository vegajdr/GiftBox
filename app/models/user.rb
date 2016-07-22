class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username
  validates_uniqueness_of :email

  has_many :accepted_friendships, -> { where status: 'accepted'}, class_name: "Friendship"
  has_many :pending_friendships, -> { where status: 'pending' }, class_name: "Friendship"
  has_many :requested_friendships, -> { where status: 'requested' }, class_name: "Friendship"

  has_many :friends, through: :accepted_friendships, foreign_key: "friend_id"

  has_many :user_holidays
  has_many :holidays, through: :user_holidays

  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :colors

  has_many :wishlists
  has_many :items, through: :wishlists

  has_many :special_days
end
