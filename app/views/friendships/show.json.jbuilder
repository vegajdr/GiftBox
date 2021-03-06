json.user do
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.username @user.username
  json.friends do
    json.array! @user.friends
  end
  json.pending_count @pending.count
  json.pending_friendships do
    json.array! @pending
  end
  json.requested_count @requested.count
  json.requested_friendships do
    json.array! @requested
  end
end
