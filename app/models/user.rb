class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: "friend_id"

  has_many :user_holidays
  has_many :holidays, through: :user_holidays

  has_many :user_interests
  has_many :interests, through: :user_interests
end
