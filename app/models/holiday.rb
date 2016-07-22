class Holiday < ApplicationRecord
  has_many :user_holidays
  has_many :users, through: :user_holidays
end
