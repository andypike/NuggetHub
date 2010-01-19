require 'spec_helper'

describe HomeController do

  context "GET index" do
    it "should be successful" do
      get :index

      response.should be_success
      response.should render_template("home/index.html.erb")
    end

    it "should get the latest posted nuggets by page" do
      nuggets = mock
      Nugget.expects(:paged_nuggets).with('1').returns(nuggets)

      get :index, { :page => 1 }

      assigns[:nuggets].should == nuggets
    end
  end

end
