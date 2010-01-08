require 'spec_helper'

describe "/account/edit" do
  before(:each) do
    assigns[:user] = User.new
    render 'account/edit'
  end

  context "When displaying the edit account page" do
    it "should show the correct form items" do
      response.should have_tag('input#user_full_name')
      response.should have_tag('input#user_username')
      response.should have_tag('input#user_email')
      response.should have_tag('input#user_password')
      response.should have_tag('input#user_password_confirmation')
    end
  end
end
