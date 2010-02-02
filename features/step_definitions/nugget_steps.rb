def create_nugget(body, title)
  params = {
          "full_name" => "A user",
          "username" => "username",
          "email" => "auser@somewhereelse.com",
          "password" => "secret",
          "password_confirmation" => "secret"
  }
  user = User.create!(params)

  @nugget = Nugget.create!(:title => title, :body => body, :user => user)
end

And /^there is a nugget entitled "([^\"]*)" with body "([^\"]*)"$/ do |title, body|
  create_nugget(body, title)
  visit nugget_path(@nugget)
end

And /^I am viewing a nugget that I have created$/ do
  @nugget = Nugget.create!(:title => "title", :body => "body", :user => @user)

  visit nugget_path(@nugget)
end

And /^there is a nugget entitled "([^\"]*)" with body "([^\"]*)" a comment "([^\"]*)"$/ do |title, body, comment|
  create_nugget(body, title)
  
  @comment = Comment.create!(:text => comment, :user => @user, :nugget => @nugget)

  visit nugget_path(@nugget)
end