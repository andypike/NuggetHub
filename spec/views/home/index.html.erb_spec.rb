require 'spec_helper'

describe "/home/index" do
  before(:each) do
    activate_authlogic
  end

  context "when displaying the homepage to an unauthenticated user" do
    before(:each) do
      template.expects(:current_user).returns(nil).at_least_once
      render 'home/index', :layout => "application"
    end

    it "should show the site logo" do
      response.should have_tag('img#logo')
    end  

    it "should show the site description" do
      response.should have_tag('h2', 'NuggetHub is a social knowledge base that allows you to share your tips and learn from others.')
    end

    it "should show the homepage title" do
      response.should have_tag('title', 'NuggetHub - Social knowledge base')
    end

    it "should show a join image button" do
      response.should have_tag('a[href=?]', '/account/new') do
        with_tag('img[src*=?]', '/images/buttons/join.gif') #Using *= (starts with) to avoid matching on the timestamp
      end
    end

    it "should show a login link" do
      response.should have_tag('a[href=?]', '/login')
    end

    it "should not show a logout link" do
      response.should_not have_tag('a[href=?]', '/logout')
    end

    it "should not show a profile link" do
      response.should_not have_tag('a[href=?]', '/profile')
    end

    it "should not show a gravatar image" do
      response.should_not have_tag('img.gravatar')
    end
  end

  context "When displaying the homepage to an authenticated user" do
    before(:each) do
      current_user = User.new
      current_user.full_name = "Andy Pike"
      current_user.email = "an@email_address.com"

      template.expects(:current_user).returns(current_user).at_least_once
      render 'home/index', :layout => "application"
    end

    it "should not show the join image button" do
      response.should_not have_tag('a[href=?]', '/account/new') do
        with_tag('img[src*=?]', '/images/buttons/join.gif') #Using *= (starts with) to avoid matching on the timestamp
      end
    end

    it "should not show a login link" do
      response.should_not have_tag('a[href=?]', '/login')
    end

    it "should show the current user's full name" do
      response.should have_tag('span.current-user', 'Andy Pike')
    end

    it "should show a logout link" do
      response.should have_tag('a[href=?]', '/logout')
    end

    it "should show a profile link" do
      response.should have_tag('a[href=?]', '/account/current/edit')
    end

    it "should show the users gravatar image" do
      response.should have_tag('img.gravatar')
    end
  end
end
