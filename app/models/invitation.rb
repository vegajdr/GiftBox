class Invitation < ApplicationRecord

  belongs_to :user, foreign_key: "created_by", class_name: "User"

end
