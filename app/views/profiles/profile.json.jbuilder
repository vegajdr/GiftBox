json.user do
  json.firstname @user.first_name
  json.lastname @user.last_name
  json.email @user.email
  json.username @user.username
  json.friends @user.friends, :username
  json.holidays @user.holidays.pluck(:name)
  json.interests @user.interests.pluck(:name)
  json.birthday do
    json.month @user.dob_month
    json.day @user.dob_day
    json.year @user.dob_year
  end
end
