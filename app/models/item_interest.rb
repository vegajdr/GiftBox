class ItemInterest < ApplicationRecord
  belongs_to :item
  belongs_to :user_interest
end
