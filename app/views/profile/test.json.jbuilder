json.user do
  json.email @user.email
end

json.holidays @user.holidays, :name
