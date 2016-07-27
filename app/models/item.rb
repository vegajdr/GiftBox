class Item < ApplicationRecord
  belongs_to :wishlist
  belongs_to :user_interest, optional: true
  belongs_to :user_holiday, optional: true

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
