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

end