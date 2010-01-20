require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :full_name => "Andy Pike",
      :email => "someone@somewhere.com",
      :username => "andy_pike-78",
      :password => "a password",
      :password_confirmation => "a password"
    }
  end

  context "When creating and validating a new user" do
    it "should not throw an exception given valid attributes" do
      User.create!(@valid_attributes)
    end

    it "should raise an exception if the full name is empty" do
      @valid_attributes[:full_name] = ''
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the email is empty" do
      @valid_attributes[:email] = ''
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the email isn't valid" do
      @valid_attributes[:email] = 'this is not an email'
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the user name is empty" do
      @valid_attributes[:username] = ''
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the user name is not unique" do
      User.create!(@valid_attributes) #First create should be successful

      #Second try should fail as they have the same username but different emails
      @valid_attributes[:email] = 'another@emailaddress.com'
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the email is not unique" do
      User.create!(@valid_attributes) #First create should be successful

      #Second try should fail as they have the same emails but different usernames
      @valid_attributes[:username] = 'someone.else'
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the password is empty" do
      @valid_attributes[:password] = ''
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the password confirmation is empty" do
      @valid_attributes[:password_confirmation] = ''
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the password and confirmation do not match" do
      @valid_attributes[:password_confirmation] = 'this is a mismatch'
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the username is less than 3 characters long" do
      @valid_attributes[:username] = '12'
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the username is less than 16 characters long" do
      @valid_attributes[:username] = '12345678901234567'
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end

    it "should raise an exception if the username contains characters other than letters, numbers, underscores and hyphens" do
      @valid_attributes[:username] = 'ert&£:> blah'
      lambda { User.create!(@valid_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
