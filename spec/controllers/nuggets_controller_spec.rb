require 'spec_helper'

describe NuggetsController do

  context "GET new" do
    before(:each) do
      @nugget = mock
      Nugget.expects(:new).returns(@nugget)

      #Mock the authorization, but it must be called
      authorization = mock
      CanCan::ResourceAuthorization.stubs(:new).returns(authorization)
      authorization.expects(:load_and_authorize_resource)
    end

    it "should be successful" do
      get :new

      response.should be_success
      response.should render_template("nuggets/new.html.erb")
    end

    it "should assign a default Nugget" do
      get :new

      assigns[:nugget].should == @nugget
    end
  end

  context "POST create" do
    before(:each) do
      #Mock the authorization, but it must be called
      authorization = mock
      CanCan::ResourceAuthorization.stubs(:new).returns(authorization)
      authorization.expects(:load_and_authorize_resource)

      @current_user = mock
      @nugget = mock
      @nugget_params = mock
      @params = {:nugget => @nugget_params}
      @controller.stubs(:current_user).returns(@current_user)
    end

    it "should create a Nugget from the passed parameters and assign the current user" do
      Nugget.expects(:new).with(@nugget_params).returns(@nugget)
      @nugget.stubs(:save).returns(true)
      @nugget.expects('user=').with(@current_user).returns(@current_user)
      
      post :create, @params
    end

    it "should save the created Nugget and redirect to the site root with a flash message" do
      Nugget.stubs(:new).with(@nugget_params).returns(@nugget)
      @nugget.stubs('user=').with(@current_user).returns(@current_user)
      @nugget.expects(:save).returns(true)

      post :create, @params

      flash[:notice].should == "Your Nugget was successfully posted"
      response.should redirect_to(root_path)
    end

    it "should render the new action if the Nugget fails to save" do
      Nugget.stubs(:new).with(@nugget_params).returns(@nugget)
      @nugget.stubs('user=').with(@current_user).returns(@current_user)
      @nugget.expects(:save).returns(false)

      post :create, @params

      response.should render_template("nuggets/new.html.erb")
    end
  end

end
