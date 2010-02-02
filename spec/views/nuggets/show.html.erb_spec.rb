require 'spec_helper'

describe "/nuggets/show" do
  before(:each) do
    activate_authlogic
    user = User.create!(:full_name => 'Andy Pike', :username => "andypike", :email => 'a@example.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')
    @nugget = Nugget.create!(:title => "Sample nugget title", :body => "Sample nugget body", :updated_at => Date.new, :user => user)
    assigns[:nugget] = @nugget
    assigns[:comment] = Comment.new

    @comments = [Comment.new(:text => 'This is a comment', :nugget => @nugget, :user => user, :updated_at => Date.new)]
  end

  context "When displaying the show nugget page" do
    before(:each) do
      template.stubs(:can?).with(:update, @nugget).returns(false)
      template.stubs(:can?).with(:create, Comment).returns(false)
    end
    
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

    it "should show the add comment box if the user has permission" do
      template.expects(:can?).with(:create, Comment).returns(true)

      render 'nuggets/show'
      response.should have_tag('textarea#comment_text')
    end
    
    it "should not show the add comment box if the user doesn't have permission" do
      template.expects(:can?).with(:create, Comment).returns(false)

      render 'nuggets/show'
      response.should_not have_tag('textarea#comment_text')
    end

    it "should show a list of comments" do
      @nugget.expects(:comments).returns(@comments).at_least_once

      render 'nuggets/show'

      response.should have_tag('div.comment p', 'This is a comment')
    end
  end
end
