class ItemHoliday < ApplicationRecord
  belongs_to :item
  belongs_to :user_holiday
end
