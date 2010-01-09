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
  end

end