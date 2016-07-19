# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nastassia = User.create! first_name: "Nastassia", last_name: "Troyer", email: "nastassia@gentoo.com", password: "password", username: "nastassia", dob_month: "06", dob_day: "26", dob_year: "1991"

sinovia = User.create! first_name: "Sinovia", last_name: "Mayfield", email: "sinovia@gentoo.com", password: "password", username: "sinovia"

vega = User.create! first_name: "Vega", last_name: "Ramirez", email: "vega@gentoo.com", password: "password", username: "vega", dob_month: "04", dob_day: "10", dob_year: "1987"

nastassia.accepted_friendships.create! friend_id: sinovia.id

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
