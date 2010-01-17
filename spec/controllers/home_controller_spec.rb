require 'spec_helper'

describe HomeController do

  context "GET index" do
    it "should be successful" do
      get :index

      response.should be_success
      response.should render_template("home/index.html.erb")
    end

    it "should get the latest posted nuggets" do
      nuggets = mock
      Nugget.expects(:all).returns(nuggets)

      get :index

      assigns[:nuggets].should == nuggets
    end
  end

end
