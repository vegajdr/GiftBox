json.user do
  json.email @user.email
end

json.friends @user.friends, :username
json.holidays @user.holidays, :name
json.interests @user.interests, :name
