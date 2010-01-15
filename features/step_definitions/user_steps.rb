Given /^I have an existing user account with the username of (.+)$/ do |username|
  params = {
    "full_name" => "A user",
    "username" => username,
    "email" => "someone@somewhere.com",
    "password" => "secret",
    "password_confirmation" => "secret"
  }
  @user = User.create!(params)
end

Given /^I am not a registered user$/ do
  User.destroy_all #Ensure that there are no users
end

Given /^I am a logged in user$/ do
  params = {
    "full_name" => "A user",
    "username" => "test.user",
    "email" => "someone@somewhere.com",
    "password" => "secret",
    "password_confirmation" => "secret"
  }
  user = User.create!(params)

  visit '/login'
  fill_in("Username", :with => user.username)
  fill_in("Password", :with => user.password)
  click_button("Login")
end