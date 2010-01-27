require 'spec_helper'

describe TagsController do
  context "GET show" do
    before(:each) do
      @params = {:id => 'OSX'}
      @tagged_nuggets = mock
      @tags = mock
    end

    it "should be successful" do
      get :show, @params

      response.should be_success
      response.should render_template("tags/show.html.erb")
    end

    it "should retrieve nuggets tagged with the the tag name passed" do
      Nugget.expects(:tagged_with).with('OSX', {:on => :tags}).returns(@tagged_nuggets)

      get :show, @params

      assigns[:tagged_nuggets] = @tagged_nuggets
    end

    it "should assign the tag name requested" do
      get :show, @params

      assigns[:tag_name] = 'OSX'
    end
    
    it "should retrieve all tags" do
      Nugget.expects(:tag_counts_on).with(:tags).returns(@tags)

      get :show, @params

      assigns[:tags] = @tags
    end
  end
end