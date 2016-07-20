json.user do
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.username @user.username
  json.friends do
    json.array! @user.friends
  end
  json.pending_friendships do
    json.array! @user.pending_friendships
  end
  json.requested_friendships do
    json.array! @user.requested_friendships
  end
end
