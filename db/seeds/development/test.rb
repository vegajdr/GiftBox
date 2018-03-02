binding.pry
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
  first_name: "Jorge",
  last_name: "Ramirez",
  email: "vega@example.com",
  password: "password",
  username: "vega",
  dob_month: "04",
  dob_day: "10",
  dob_year: "1987")

nastassia.generate_token_for "Gentoo User"
sinovia.generate_token_for "Gentoo User"
vega.generate_token_for "Gentoo User"


nastassia.accepted_friendships.create! friend_id: sinovia.id
Ideabox.generate nastassia, sinovia
sinovia.requested_friendships.create! friend_id: vega.id
Ideabox.generate sinovia, vega
sinovia.accepted_friendships.create! friend_id: nastassia.id
vega.accepted_friendships.create! friend_id: nastassia.id
Ideabox.generate nastassia, vega

# Holidays
["Christmas",
"Hannukah",
"Thanksgiving",
"New Year's",
"Valentine's Day",
"Ramadan"].each do |holiday|
  hol = Holiday.create! name: holiday, preset?: true
end

# Interests
[ "Arts & Entertainment",
"Autos & Vehicles",
'Beauty',
'Health & Fitness',
'Books & Literature',
'Computers & Electronics',
'Design',
'Food & Drink',
'Games',
'Hobbies & Leisure',
'Home & Garden',
'Internet & Technology',
'Magic & Illusions',
'Movies & Film',
'Music',
'Pets & Animals',
'Programming & Web Development',
'Science',
'Sports',
'Travel'].each do |interest|
  int = Interest.create! name: interest, preset?: true
end



4.times do
  u = User.create!(
    first_name:   Faker::Name.first_name,
    last_name:    Faker::Name.last_name,
    email:        Faker::Internet.email,
    password:     "password",
    username:     Faker::Name.first_name,
    dob_day:      "19",
    dob_month:    "05",
    dob_year:     "1945")
   Friendship.request u, nastassia
   Friendship.request u, vega
   Friendship.request u, sinovia
  u.generate_token_for "Gentoo User"
end

4.times do
  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    username: Faker::Name.first_name,
    dob_day:      "19",
    dob_month:    "05",
    dob_year:     "1945")
   Friendship.request u, nastassia
   Friendship.accept nastassia, u
   idea_n = Ideabox.create! user: nastassia, friend: u

   Friendship.request u, vega
   Friendship.accept vega, u
   idea_v = Ideabox.create! user: vega, friend: u

   Friendship.request u, sinovia
   Friendship.accept sinovia, u
   idea_s = Ideabox.create! user: sinovia, friend: u

   [idea_n, idea_s, idea_v].each do |ideabox|
       ideabox.ideas.create! text: "Ring"
       ideabox.ideas.create! text: "Shirt"
       ideabox.ideas.create! text: "Gift Card"
   end

  u.generate_token_for "Gentoo User"
end

User.all.each do |user|
    books = user.wishlists.create! name: "Books"
    movies = user.wishlists.create! name: "Movies"
    gift_cards = user.wishlists.create! name: "Gift Cards"

    books.items.create! name: "The Brothers Karamazov"
    books.items.create! name: "Slaughterhouse-five"
    books.items.create! name: "One Flew Over The Cuckoo's Nest"

    movies.items.create! name: "Dr. Strangelove"
    movies.items.create! name: "Spotlight"
    movies.items.create! name: "Pan's Labyrinth"

    gift_cards.items.create! name: "Panera Bread"
    gift_cards.items.create! name: "Dame's Chicken and Waffles"
    gift_cards.items.create! name: "Target"

    user.user_interests.create! interest: Interest.all.sample
    user.user_holidays.create!  holiday: Holiday.all.sample
end


  # nastassia.user_holidays.create holiday: Holiday.all.sample
  vega.user_holidays.create     holiday: Holiday.all.sample
  # sinovia.user_holidays.create  holiday: Holiday.all.sample




5.times do
  nastassia.user_interests.create! interest: Interest.all.sample
  vega.user_interests.create! interest: Interest.all.sample
  sinovia.user_interests.create! interest: Interest.all.sample
end


vega.favorites.create!(
  color:      "Green",
  animal:     "Aardwolf",
  season:     "Spring",
  restaurant: "Brigs",
  custom:     ""
)

nastassia.favorites.create!(
  color:      "Orange",
  animal:     "Cat",
  season:     "Summer",
  restaurant: "IHOP",
  custom:     ""
)

sinovia.favorites.create!(
  color:      "Red",
  animal:     "Tiger",
  season:     "Spring",
  restaurant: "Mellow Mushroom",
  custom:     ""
)
