json.user do
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.username @user.username
  json.friends @user.friends, :username
  json.holidays @user.holidays.pluck(:name)
  json.colors @user.colors.pluck(:name)
  json.interests @user.interests.pluck(:name)
  json.birthday do
    json.dob_month @user.dob_month
    json.dob_day @user.dob_day
    json.dob_year @user.dob_year
  end
end
