json.array! @user do |user|
  json.id       user.id
  json.email    user.email
  json.nickname user.nickname
end
