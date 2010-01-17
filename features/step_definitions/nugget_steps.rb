And /^there is a nugget entitled "([^\"]*)" with body "([^\"]*)"$/ do |title, body|
  params = {
    "full_name" => "A user",
    "username" => "username",
    "email" => "someone@somewhere.com",
    "password" => "secret",
    "password_confirmation" => "secret"
  }
  user = User.create!(params)

  Nugget.create!(:title => title, :body => body, :user => user)
end