require 'spec_helper'

describe "/home/index" do
  before(:each) do
    render 'home/index', :layout => "application"
  end

  context "when displaying the homepage to an unauthenticated user" do
    before(:each) do
      assigns[:current_user] = nil
    end

    it "should show the site logo" do
      response.should have_tag('img#logo')
    end  

    it "should show the site description" do
      response.should have_tag('h1', 'NuggetHub is a social knowledge base that allows you to share your tips and learn from others.')
    end

    it "should show the homepage title" do
      response.should have_tag('title', 'NuggetHub - Social knowledge base')
    end

    it "should show a sign up button" do
      response.should have_tag('button#sign-up', 'Sign Up')
    end

    it "should show a login button" do
      response.should have_tag('button#login', 'Login')
    end
  end

  
end
