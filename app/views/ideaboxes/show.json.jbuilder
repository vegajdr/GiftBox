json.user           @ideabox.user.username
json.friend         @ideabox.friend.username
json.ideabox do
  json.id           @ideabox.id
  json.array!       @ideabox.ideas
end
