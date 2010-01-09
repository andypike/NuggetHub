require 'spec_helper'

describe "/account/new" do
  before(:each) do
    assigns[:user] = User.new
    render 'account/new'
  end

  context "When displaying the new account page" do
    it "should show the correct form items" do
      response.should have_tag('input#user_full_name')
      response.should have_tag('input#user_username')
      response.should have_tag('input#user_email')
      response.should have_tag('input#user_password')
      response.should have_tag('input#user_password_confirmation')
      response.should have_tag('input#user_submit[value=?]', 'Join')
    end
  end
end
