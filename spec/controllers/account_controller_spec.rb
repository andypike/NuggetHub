require 'spec_helper'

describe AccountController do
  before(:each) do
    @user = User.new
    @user.full_name = "Andy Pike"
    User.expects(:new).returns @user
  end
  
  context "GET new" do
    it "should be successful" do
      get :new

      response.should be_success
      response.should render_template("account/new.html.erb")
    end

    it "should assign a default User" do
      get :new

      assigns[:user].should == @user
    end
  end

  context 'POST create' do
    it "should save a new user, set the flash message and redirect to the root url" do
      @user.expects(:save).returns(true)

      post :create

      flash[:notice].should == "Hello Andy Pike, welcome to NuggetHub."
      response.should redirect_to(root_path)
    end

    it "should render the new action if the user fails to save" do
      @user.expects(:save).returns(false)

      post :create

      response.should render_template("account/new.html.erb")
    end
  end
end