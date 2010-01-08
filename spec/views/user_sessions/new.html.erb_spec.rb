require 'spec_helper'

describe "/user_sessions/new" do
  before(:each) do
    activate_authlogic
    assigns[:user_session] = UserSession.new
    render 'user_sessions/new'
  end

  context "When displaying the login page" do
    it "should show the correct form items" do
      response.should have_tag('input#user_session_username')
      response.should have_tag('input#user_session_password')
      response.should have_tag('input#user_session_remember_me')
    end
  end
end