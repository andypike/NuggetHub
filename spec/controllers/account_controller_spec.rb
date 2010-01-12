require 'spec_helper'

describe AccountController do
  
  context "GET new" do
    before(:each) do
      @user = mock()
      User.expects(:new).returns @user
    end

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
    before(:each) do
      @user = mock()
      User.expects(:new).returns @user
    end

    it "should save a new user, set the flash message and redirect to the root url" do
      @user.expects(:save).returns(true)
      @user.expects(:full_name).returns("Andy Pike")

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

  context 'GET edit' do
    before(:each) do
      @current_user = mock()
      @controller.stubs(:current_user).returns(@current_user)
      @controller.stubs(:cannot?).returns(false)
    end

    it "should be successful if a user is logged in" do
      get :edit

      response.should be_success
      response.should render_template("account/edit.html.erb")
    end

    it "should assign the current user if a user is logged in" do
      get :edit

      assigns[:user].should == @current_user
    end

    it "should fail if a user is not logged in" do
      @controller.stubs(:cannot?).returns(true)

      get :edit

      response.should_not be_success
      response.should_not render_template("account/edit.html.erb")
    end
  end

  context 'POST update' do
    before(:each) do
      @current_user = mock()
      @params = { :user => mock() }
      @controller.stubs(:current_user).returns(@current_user)
      @controller.stubs(:cannot?).returns(false)
    end

    it "should update the current user's properties from those posted" do
      @current_user.expects(:update_attributes).with(@params[:user]).returns(true)

      post :update, @params
    end

    it "should add a success message to the flash and redirect back to the site root if the update was successful" do
      @current_user.stubs(:update_attributes).with(@params[:user]).returns(true)

      post :update, @params

      flash[:notice].should == "Your account was successfully updated."
      response.should redirect_to(root_path)
    end

    it "should render the edit action if the update fails" do
      @current_user.stubs(:update_attributes).with(@params[:user]).returns(false)

      post :update, @params
      
      response.should render_template("account/edit.html.erb")
    end
    
    it "should fail if a user is not logged in" do
      @controller.stubs(:cannot?).returns(true)

      post :update, @params

      response.should_not be_success
    end
  end
end