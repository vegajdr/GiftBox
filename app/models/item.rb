class Item < ApplicationRecord
  belongs_to :wishlist

  has_many :item_interests
  has_many :user_interests, through: :item_interests

  has_many :item_holidays
  has_many :user_holidays, through: :item_holidays


  validates_presence_of :name

end
