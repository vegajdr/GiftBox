class Holiday < ApplicationRecord
  has_many :user_holidays
  has_many :users, through: :user_holidays

  validates_presence_of :name
end
