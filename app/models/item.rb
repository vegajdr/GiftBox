class Item < ApplicationRecord
  belongs_to :wishlist

  has_many :item_interests
  has_many :user_interests, through: :item_interests

  has_many :item_holidays
  has_many :user_holidays, through: :item_holidays


  validates_presence_of :name


  def interest
    if self.user_interest
      self.user_interest.interest
    else
      nil
    end
  end

  def holiday
    if self.user_holiday
      self.user_holiday.holiday
    else
      nil
    end
  end

end
