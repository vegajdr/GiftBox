class Ideabox < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  has_many :ideas, dependent: :destroy

  def self.generate user, friend
    self.where(user: user, friend: friend).first_or_create!
    self.where(user: friend, friend: user).first_or_create!
  end
end
