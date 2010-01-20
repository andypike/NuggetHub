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

And /^I am viewing a nugget that I have created$/ do
  @nugget = Nugget.create!(:title => "title", :body => "body", :user => @user)

  visit nugget_path(@nugget)
end