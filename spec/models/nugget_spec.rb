require 'spec_helper'

describe Nugget do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body",
      :user => User.new 
    }
  end

  it "should create a new instance given valid attributes" do
    Nugget.create!(@valid_attributes).should be_true
  end

  it "should not create a new instance if the title is missing" do
    @valid_attributes[:title] = ""
    lambda { Nugget.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  it "should not create a new instance if the body is missing" do
    @valid_attributes[:body] = ""
    lambda { Nugget.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  it "should not create a new instance if the user is missing" do
    @valid_attributes[:user] = nil
    lambda { Nugget.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
  end
end
