require 'spec_helper'

describe "/nuggets/new" do
  before(:each) do
    assigns[:nugget] = Nugget.new
    render 'nuggets/new'
  end

  context "When displaying the new nugget page" do
    it "should show the correct form items" do
      response.should have_tag('input#nugget_title')
      response.should have_tag('textarea#nugget_body')
      response.should have_tag('input#nugget_submit[value=?]', 'Post Nugget')
    end
  end
end
