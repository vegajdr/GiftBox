# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nastassia = User.create! email: "nastassia@gentoo.com", password: "password"
sinovia = User.create! email: "sinovia@gentoo.com", password: "password"
vega = User.create! email: "vega@gentoo.com", password: "password"

christmas = Holiday.create! name: "Christmas"
birthday = Holiday.create! name: "Birthday"
anniversary = Holiday.create! name: "Anniversary"
new_year = Holiday.create! name: "New Year's Eve"
valentines = Holiday.create! name: "Valentine's Day"

nastassia.user_holidays.create holiday_id: christmas.id
nastassia.user_holidays.create holiday_id: birthday.id
nastassia.user_holidays.create holiday_id: anniversary.id
nastassia.user_holidays.create holiday_id: new_year.id
nastassia.user_holidays.create holiday_id: valentines.id

sinovia.user_holidays.create holiday_id: christmas.id
sinovia.user_holidays.create holiday_id: birthday.id
sinovia.user_holidays.create holiday_id: anniversary.id
sinovia.user_holidays.create holiday_id: new_year.id
sinovia.user_holidays.create holiday_id: valentines.id

vega.user_holidays.create holiday_id: christmas.id
vega.user_holidays.create holiday_id: birthday.id
vega.user_holidays.create holiday_id: anniversary.id
vega.user_holidays.create holiday_id: new_year.id
vega.user_holidays.create holiday_id: valentines.id
