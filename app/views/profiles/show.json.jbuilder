json.user do
  json.email @user.email
  json.username @user.username
  json.friends @user.friends, :username
  json.holidays do
    json.array! @user.holidays
  end
  json.interests @user.interests, :name
  json.birthday do
    json.month @user.dob_month
    json.day @user.dob_day
    json.year @user.dob_year
  end
end
