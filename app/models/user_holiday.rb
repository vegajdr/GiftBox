class UserHoliday < ApplicationRecord
  belongs_to :user
  belongs_to :holiday
end
