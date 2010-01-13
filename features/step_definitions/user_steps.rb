Given /^I am the registered user (.+)$/ do |username|
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
