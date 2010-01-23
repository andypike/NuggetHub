require 'spec_helper'

describe Mail do

  context "When sending the confirmation email" do
    it "should assign the required variables" do
      recipient = "blah@blah.com"
      name = "Andy Pike"

      mail = Mail.create_confirmation(recipient, name)
      
      mail.to.should == [recipient]
      mail.subject.should == "Welcome to NuggetHub"
      mail.from.should == ["support@nuggethub.com"]
      mail.body.should == "Hello #{name},\n\nWelcome to NuggetHub!\n\nWe hope you enjoy storing and sharing your little Nuggets of information and wisdom.\n\nJust head over to http://nuggethub.com to start sharing.\n\nRegards\n\nThe NuggetHub Team"
    end
  end

end