require 'spec_helper'

describe Nugget do

  context "When creating a new Nugget" do
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

    it "should not create a new instance if the body is longer than the MAX_LENGTH characters" do
      @valid_attributes[:body] = Array.new(Nugget.MAX_LENGTH + 1, "X").join
      lambda { Nugget.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should create a new instance if the body is MAX_LENGTH characters in length" do
      @valid_attributes[:body] = Array.new(Nugget.MAX_LENGTH, "X").join
      Nugget.create!(@valid_attributes).should be_true
    end
  end

  context "When getting all nuggets by page" do
    it "should use will_paginate" do
      Nugget.expects(:paginate).returns(mock)
      
      Nugget.paged_nuggets(1)
    end
  end

  context "When checking method generation" do
    before(:each) do
      @nugget = Nugget.new
    end
    
    it "should generate a tag_list accessor/setter for each tag type" do
      @nugget.should respond_to(:tag_list)
      @nugget.should respond_to(:tag_list=)
    end
  end
end
