json.user do
  json.email @user.email
  json.username @user.username
  json.friends @user.friends, :username
  json.holidays @user.holidays, :name
  json.interests @user.interests, :name
end
