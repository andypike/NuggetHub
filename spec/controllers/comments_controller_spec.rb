require 'spec_helper'

describe CommentsController do
  before(:each) do
    #Mock the authorization, but it must be called
    authorization = mock
    CanCan::ResourceAuthorization.stubs(:new).returns(authorization)
    authorization.expects(:load_and_authorize_resource)
  end

  context "POST create" do
    before(:each) do
      @current_user = stub
      @comment = mock
      @comment_params = stub
      @nugget = stub
      @nugget_id = '2'
      @params = {:comment => @comment_params, :nugget_id => @nugget_id}
      @controller.stubs(:current_user).returns(@current_user)

      Comment.stubs(:new).with(@comment_params).returns(@comment)
      Nugget.stubs(:find).with(@nugget_id).returns(@nugget)
      @comment.stubs(:user=).with(@current_user).returns(@current_user)
      @comment.stubs(:nugget=).with(@nugget).returns(@nugget)
      @comment.stubs(:save).returns(true)
    end

    it "should create a Comment from the passed parameters, assign the current user" do
      Comment.expects(:new).with(@comment_params).returns(@comment)

      post :create, @params
    end

    it "should load the passed Nugget" do
      Nugget.expects(:find).with(@nugget_id).returns(@nugget)

      post :create, @params
    end

    it "should assign the current user to the created Comment" do
      @comment.expects(:user=).with(@current_user).returns(@current_user)

      post :create, @params
    end

    it "should assign the current user to the created Comment" do
      @comment.expects(:nugget=).with(@nugget).returns(@nugget)

      post :create, @params
    end

    it "should save the created Comment" do
      @comment.expects(:save).returns(true)
      
      post :create, @params
    end

    it "should add a message to the flash and redirect to the nugget show page if saving the comment was successful" do
      @comment.stubs(:save).returns(true)

      post :create, @params

      flash[:notice].should == "Your comment was successfully posted"
      response.should redirect_to(nugget_path @nugget)
    end

    it "should redirect to the nugget show page if saving the comment failed with an error message" do
      @comment.stubs(:save).returns(false)

      post :create, @params

      flash[:error].should == "Unable to save your comment, was it empty?"
      response.should redirect_to(nugget_path @nugget)
    end
  end

end