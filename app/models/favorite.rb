class Favorite < ApplicationRecord
  belongs_to :user

  after_create do
    self.update(
      color_string: "color",
      animal_string: "animal",
      restaurant_string: "restaurant",
      season_string: "season",
      custom_string: "custom"
    )
  end
end
