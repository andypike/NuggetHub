And /^the username "([^\"]*)" is already in use$/ do | username |
  params = {
    "full_name" => "A user",
    "username" => username,
    "email" => "testing@test.com",
    "password" => "secret",
    "password_confirmation" => "secret"
  }
  @user = User.create!(params)
end

And /^the email "([^\"]*)" is already in use$/ do |email|
  params = {
    "full_name" => "A user",
    "username" => "another.user",
    "email" => email,
    "password" => "secret",
    "password_confirmation" => "secret"
  }
  @user = User.create!(params)
end