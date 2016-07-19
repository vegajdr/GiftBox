# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nastassia = User.create! email: "nastassia@gentoo.com", password: "password", username: "nastassia"
sinovia = User.create! email: "sinovia@gentoo.com", password: "password", username: "sinovia"
vega = User.create! email: "vega@gentoo.com", password: "password", username: "vega"

nastassia.friendships.create! friend_id: sinovia.id

["Christmas",
"Birthday",
"Anniversary",
"New Year's",
"Valentine's Day"].each do |holiday|
  hol = Holiday.create! name: holiday
  nastassia.user_holidays.create holiday_id: hol.id
  vega.user_holidays.create holiday_id: hol.id
  sinovia.user_holidays.create holiday_id: hol.id
end


[ "Sports",
"Cooking",
"Reading",
"Drawing",
"Technology",
"Gaming",
"Table Tennis"].each do |interest|
  int = Interest.create! name: interest
  nastassia.user_interests.create interest_id: int.id
  vega.user_interests.create interest_id: int.id
  sinovia.user_interests.create interest_id: int.id
end
