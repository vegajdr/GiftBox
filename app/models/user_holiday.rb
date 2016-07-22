class UserHoliday < ApplicationRecord
  belongs_to :user
  belongs_to :holiday

  has_many :items
end
