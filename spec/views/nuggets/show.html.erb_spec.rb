require 'spec_helper'

describe "/nuggets/show" do
  before(:each) do
    assigns[:nugget] = Nugget.new(:title => "Sample nugget title", :body => "Sample nugget body", :updated_at => Date.new, :user => User.new(:username => "andypike", :email => 'a@example.com'))
    render 'nuggets/show'
  end

  context "When displaying the show nugget page" do
    it "should show the nugget details" do
      response.should have_tag('h1', 'Sample nugget title')
      response.should have_tag('p', 'Sample nugget body')
      response.should have_tag('div', 'By andypike')
    end
  end
end
