require 'spec_helper'

describe "/nuggets/show" do
  before(:each) do
    activate_authlogic
    @nugget = Nugget.create!(:title => "Sample nugget title", :body => "Sample nugget body", :updated_at => Date.new, :user => User.new(:username => "andypike", :email => 'a@example.com'))
    assigns[:nugget] = @nugget
  end

  context "When displaying the show nugget page" do
    it "should show the nugget details" do
      render 'nuggets/show'

      response.should have_tag('h1', 'Sample nugget title')
      response.should have_tag('div.nugget-body', 'Sample nugget body')
    end

    it "should show the edit link if the user has permission" do
      template.expects(:can?).with(:update, @nugget).returns(true)

      render 'nuggets/show'
      response.should have_tag('a.edit')
    end
    
    it "should not show the edit link if the user doesn't have permission" do
      template.expects(:can?).with(:update, @nugget).returns(false)

      render 'nuggets/show'
      response.should_not have_tag('a.edit')
    end
  end
end
