require 'spec_helper'

describe UserSessionsController do

  context "GET new" do
    before(:each) do
      @user_session = mock()
      UserSession.expects(:new).returns @user_session
    end
    
    it "should be successful" do
      get :new

      response.should be_success
      response.should render_template("user_sessions/new.html.erb")
    end

    it "should assign a default UserSession" do
      get :new

      assigns[:user_session].should == @user_session
    end
  end

  context "POST create" do
    before(:each) do
      @user_session_params = mock()
      @user_session = mock()
      @params = {:user_session => @user_session_params}
    end
    
    it "should create a UserSession from the passed parameters" do
      UserSession.expects(:new).with(@user_session_params).returns(@user_session)
      @user_session.stubs(:save).returns(true)
      
      post :create, @params
    end

    it "should save the create UserSession and redirect to the site root with a flash message" do
      UserSession.stubs(:new).with(@user_session_params).returns(@user_session)
      @user_session.expects(:save).returns(true)

      post :create, @params

      flash[:notice].should == "Welcome back to NuggetHub."
      response.should redirect_to(root_path)
    end

    it "should render the new action if the UserSession fails to save" do
      UserSession.stubs(:new).with(@user_session_params).returns(@user_session)
      @user_session.expects(:save).returns(false)

      post :create, @params

      response.should render_template("user_sessions/new.html.erb")
    end
  end

  context "GET destroy" do
    before(:each) do
      @session = mock()
    end

    it "should destroy the current session" do
      UserSession.expects(:find).returns(@session)
      @session.expects(:destroy)

      get :destroy
    end

    it "should add a logged out message to the flash" do
      UserSession.stubs(:find).returns(@session)
      @session.stubs(:destroy)

      get :destroy

      flash[:notice].should == "You have been successfully logged out."
    end

    it "should redirect to the site root url" do
      UserSession.stubs(:find).returns(@session)
      @session.stubs(:destroy)
      
      get :destroy
      
      response.should redirect_to(root_path)
    end
  end
end
