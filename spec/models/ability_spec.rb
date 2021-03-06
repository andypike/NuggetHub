require 'spec_helper'

describe Ability do

  context "When checking a user's ability to edit a user" do
    it "should allow a user to edit themselves" do
      user = User.new
      ability = Ability.new(user)
      ability.can?(:update, user).should be_true
    end

    it "should not allow a user to edit any other user" do
      user = User.new
      ability = Ability.new(user)
      ability.can?(:update, User.new).should be_false
    end

    it "should not allow a non-logged in user to edit a user" do
      ability = Ability.new(nil)
      ability.can?(:update, User.new).should be_false
    end
  end
  
  context "When checking a user's ability to create a nugget" do
    it "should allow a user to create a nugget" do
      ability = Ability.new(User.new)
      ability.can?(:create, Nugget).should be_true
    end

    it "should not allow a non-logged in user to create a nugget" do
      ability = Ability.new(nil)
      ability.can?(:create, Nugget).should be_false
    end
  end

  context "When checking a user's ability to view a nugget" do
    it "should allow logged in users to view a nugget" do
      ability = Ability.new(User.new)
      ability.can?(:read, Nugget).should be_true
    end

    it "should allow a non-logged in user to view a nugget" do
      ability = Ability.new(nil)
      ability.can?(:read, Nugget).should be_true
    end
  end

  context "When checking a user's ability to edit a nugget" do
    before(:each) do
      @user_that_owns_nugget = User.new
      @admin_user = User.new(:is_admin => true)
      @nugget = Nugget.new(:title => "blah", :body => "blah", :user => @user_that_owns_nugget)
    end

    it "should allow a logged in user to edit their own nuggets" do
      ability = Ability.new(@user_that_owns_nugget)
      ability.can?(:update, @nugget).should be_true
    end

    it "should not allow a user to edit another user's nugget" do
      ability = Ability.new(User.new)
      ability.can?(:update, @nugget).should be_false
    end

    it "should not allow a non-logged in user to edit any nugget" do
      ability = Ability.new(nil)
      ability.can?(:update, @nugget).should be_false
    end
    
    it "should allow an admin user to edit a nugget created by another user" do
      ability = Ability.new(@admin_user)
      ability.can?(:update, @nugget).should be_true
    end
  end

  context "When checking a user's ability to add comments to a nugget" do
    it "should not allow a non-logged in user to create comments" do
      ability = Ability.new(nil)
      ability.can?(:create, Comment).should be_false
    end
    
    it "should allow a logged in user to create comments" do
      ability = Ability.new(User.new)
      ability.can?(:create, Comment).should be_true
    end
  end
end