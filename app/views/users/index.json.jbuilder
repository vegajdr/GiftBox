json.array! @users do |user|
  json.username         user.username
  json.first_name       user.first_name
  json.last_name        user.last_name
  json.friend_status    user.friends.include? current_user
end
