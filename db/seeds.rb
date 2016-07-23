# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nastassia = User.create! first_name: "Nastassia", last_name: "Troyer", email: "nastassia@gentoo.com", password: "password", username: "nastassia", dob_month: "06", dob_day: "26", dob_year: "1991"

sinovia = User.create! first_name: "Sinovia", last_name: "Mayfield", email: "sinovia@gentoo.com", password: "password", username: "sinovia", dob_month: "05", dob_day: "24", dob_year: "1988"

vega = User.create! first_name: "Vega", last_name: "Ramirez", email: "vega@gentoo.com", password: "password", username: "vega", dob_month: "04", dob_day: "10", dob_year: "1987"

nastassia.accepted_friendships.create! friend_id: sinovia.id

User.all.each do |user|
  5.times do
    w = user.wishlists.create! name: Faker::Hipster.word
    5.times do
      w.items.create! name: Faker::Beer.name
    end
  end

end

# Holidays
["Christmas",
"Birthday",
"Anniversary",
"New Year's",
"Valentine's Day"].each do |holiday|
  hol = Holiday.create! name: holiday, preset?: true
  nastassia.user_holidays.create holiday_id: hol.id
  vega.user_holidays.create holiday_id: hol.id
  sinovia.user_holidays.create holiday_id: hol.id
end

# Interests
[ "Sports",
"Cooking",
"Reading",
"Drawing",
"Technology",
"Gaming",
"Table Tennis"].each do |interest|
  int = Interest.create! name: interest, preset?: true
  nastassia.user_interests.create interest_id: int.id
  vega.user_interests.create interest_id: int.id
  sinovia.user_interests.create interest_id: int.id
end

# Colors
[ "White",
"Blue",
"Red",
"Yellow",
"Orange",
"Pink",
"Black",
"Green",
"Brown"].each do |color|
  nastassia.colors.create! name: color
  vega.colors.create! name: color
  sinovia.colors.create! name: color
end
