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
    end

    it "should render the correct template" do
      get :new
      response.should render_template('account/new.html.erb')
    end

    it "should assign a default User" do
      get :new
      assigns[:user].should == @user
    end
  end

  context 'POST create' do
    before(:each) do
      @user = mock()
      User.stubs(:new).returns @user
    end

    context "a valid user" do
      before(:each) do
        @user.stubs(:full_name).returns('Andy Pike')
        @user.stubs(:email).returns('blah@blah.com')
        @user.stubs(:save).returns(true)
        Mail.stubs(:deliver_confirmation)
      end

      it "should save the user" do
        @user.expects(:save).returns(true)
        post :create
      end

      it "should set the flash" do
        post :create
        flash[:notice].should =~ /Andy Pike/
      end

      it "should redirect to root" do
        post :create
        response.should redirect_to(root_path)
      end

      it "should send a confirmation email" do
        Mail.expects(:deliver_confirmation).with(@user.email, @user.full_name)
        post :create
      end
    end

    context "with an invalid user" do
      it "should render the new action" do
        @user.stubs(:save).returns(false)
        post :create

        response.should render_template("account/new.html.erb")
      end
    end
  end

  context 'GET edit' do
    before(:each) do
      @current_user = mock()
      @controller.stubs(:current_user).returns(@current_user)
      @controller.stubs(:cannot?).returns(false)
    end

    context "with a logged in user" do
      it "should be successful" do
        get :edit
        response.should be_success
      end

      it "should render the correct template" do
        get :edit
        response.should render_template('account/edit.html.erb')
      end

      it "should assign the current user" do
        get :edit
        assigns[:user].should == @current_user
      end
    end

    context "with anonymous users" do
      it "should fail" do
        @controller.stubs(:cannot?).returns(true)
        get :edit
        response.should_not be_success
      end
    end
  end

  context 'POST update' do
    before(:each) do
      @current_user = mock()
      @params = { :user => mock() }
      @controller.stubs(:current_user).returns(@current_user)
      @controller.stubs(:cannot?).returns(false)
      
      @current_user.stubs(:update_attributes).with(@params[:user]).returns(true)
    end

    def do_post
      post :update, @params
    end

    context "with a logged in user" do
      it "should update the current user's attributes" do
        @current_user.expects(:update_attributes).with(@params[:user]).returns(true)
        do_post
      end

      context "with a valid user" do
        it "should add a success message to the flash" do
          do_post
          flash[:notice].should == "Your account was successfully updated."
        end

        it "should redirect back to the site root" do
          do_post
          response.should redirect_to(root_path)
        end
      end

      context "with an invalid user" do
        it "should render the edit template" do
          @current_user.stubs(:update_attributes).with(@params[:user]).returns(false)
          do_post
          response.should render_template('account/edit.html.erb')
        end
      end
    end

    context "with an anonymous user" do
      it "should fail" do
        @controller.stubs(:cannot?).returns(true)
        do_post
        response.should_not be_success
      end
    end
  end
end
