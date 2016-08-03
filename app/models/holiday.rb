class Holiday < ApplicationRecord
  has_many :user_holidays, dependent: :destroy
  has_many :users, through: :user_holidays

end
