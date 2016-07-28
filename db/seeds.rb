# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nastassia = User.create!(
  first_name: "Nastassia",
  last_name: "Troyer",
  email: "nastassia@gentoo.com",
  password: "password",
  username: "nastassia",
  dob_month: "06",
  dob_day: "26",
  dob_year: "1991")

sinovia = User.create!(
  first_name: "Sinovia",
  last_name: "Mayfield",
  email: "sinovia@gentoo.com",
  password: "password",
  username: "sinovia",
  dob_month: "05",
  dob_day: "24",
  dob_year: "1988")

vega = User.create!(
  first_name: "Vega",
  last_name: "Ramirez",
  email: "vega@gentoo.com",
  password: "password",
  username: "vega",
  dob_month: "04",
  dob_day: "10",
  dob_year: "1987")

nastassia.generate_token_for "Gentoo User"
sinovia.generate_token_for "Gentoo User"
vega.generate_token_for "Gentoo User"


nastassia.accepted_friendships.create! friend_id: sinovia.id
sinovia.requested_friendships.create! friend_id: vega.id
sinovia.accepted_friendships.create! friend_id: nastassia.id

4.times do
  u = User.create! first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", username: Faker::Internet.user_name
   Friendship.request u, nastassia
   Friendship.request u, vega
   Friendship.request u, sinovia
  u.generate_token_for "Gentoo User"
end

4.times do
  u = User.create! first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", username: Faker::Internet.user_name
   Friendship.request u, nastassia
   Friendship.accept u, nastassia
   Friendship.request u, vega
   Friendship.accept u, vega
   Friendship.request u, sinovia
   Friendship.accept u, sinovia
  u.generate_token_for "Gentoo User"
end

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
[ "Arts & Entertainment",
"Autos & Vehicles",
'Beauty',
'Health & Fitness',
'Books & Literature',
'Business & Industrial',
'Cats',
'Computers & Electronics',
'Design',
'Dogs',
'Finance',
'Food & Drink',
'Games',
'Hobbies & Leisure',
'Home & Garden',
'Internet & Technology',
'Jobs & Education',
'Law & Government',
'Magic & Illusions',
'Movies & Film',
'Music',
'News',
'Pets & Animals',
'Programming & Web Development',
'Real Estate',
'Science',
'Shopping',
'Sports',
'Travel'].each do |interest|
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
