json.user do
  json.first_name   @user.first_name
  json.last_name    @user.last_name
  json.email        @user.email
  json.username     @user.username
  json.friended?    @accepted_friend
  json.friends do
    json.array!     @user.friends
  end
  json.holidays do
    json.array!     @user.holidays
  end
  json.interests do
    json.array!     @user.interests
  end
  json.favorites do
    json.array!     @user.colors
  end
  json.birthday do
    json.dob_month  @user.dob_month
    json.dob_day    @user.dob_day
    json.dob_year   @user.dob_year
  end
end
