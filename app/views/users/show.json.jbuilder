json.message message if defined?(message)
json.user do
  json.partial! 'users/user', user: @user
end