class UserInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest

  has_many :items
end
