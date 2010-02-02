require 'spec_helper'

describe Comment do

  context "When creating a new Comment" do
    before(:each) do
      user = User.create!(:full_name => 'Andy Pike', :username => "andypike", :email => 'a@example.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')
      @valid_attributes = {
        :text => "value for text",
        :nugget => Nugget.create!(:title => "Sample nugget title", :body => "Sample nugget body", :user => user),
        :user => user
      }
    end

    it "should create a new instance given valid attributes" do
      Comment.create!(@valid_attributes)
    end

    it "should not create a new instance if the text is missing" do
        @valid_attributes[:text] = ""
        lambda { Comment.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
