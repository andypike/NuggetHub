require 'spec_helper'

describe "/nuggets/new" do
  before(:each) do
    activate_authlogic

    current_user = User.new
    current_user.full_name = "Andy Pike"
    current_user.email = "an@email_address.com"

    template.expects(:current_user).returns(current_user).at_least_once

    assigns[:nugget] = Nugget.new(:body => "")
    assigns[:hide_add_nugget] = true
    render 'nuggets/new', :layout => "application"
  end

  context "When displaying the new nugget page" do
    it "should show the correct form items" do
      response.should have_tag('input#nugget_title')
      response.should have_tag('textarea#nugget_body')
      response.should have_tag('input#nugget_submit[value=?]', 'Post Nugget')
    end

    it "should hide the add new nugget button" do
      response.should_not have_tag('a#add_nugget')
    end
  end
end
