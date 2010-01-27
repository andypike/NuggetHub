require 'spec_helper'

describe "/tags/show" do

  context "When displaying nuggets for a valid tag name" do
    before(:each) do
      nugget = Nugget.create!(:title => "Tagged Nugget title", :body => "the body", :user => User.new(:email => "someone@somewhere.com"), :tag_list => "Computing OSX")
      @tag_name = 'Invalid-Tag'

      assigns[:tag_name] = @tag_name
      assigns[:tagged_nuggets] = [nugget]

      render 'tags/show'
    end

    it "should show the correct page title" do
      response.should have_tag('h1', "#{@tag_name} Nuggets")
    end

    it "should show the tagged nuggets titles" do
      response.should have_tag('h3', 'Tagged Nugget title')
    end
  end

  context "When displaying nuggets for a tag that isn't used" do
    before(:each) do
      @tag_name = 'Invalid-Tag'
      assigns[:tag_name] = @tag_name
      assigns[:tagged_nuggets] = []
    end

    it "should show a message to the user" do
      render 'tags/show'
      response.should have_tag('p', "There are no Nuggets tagged with #{@tag_name}")
    end
  end

end