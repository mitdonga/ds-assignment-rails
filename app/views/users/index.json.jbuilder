json.message message if defined?(message)
json.users do
  json.array! @users do |user|
    json.partial! 'users/user', user: user
  end
end