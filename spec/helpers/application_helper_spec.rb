require 'spec_helper'

describe ApplicationHelper do

  context "When generating the path for a tag" do
    it "should return an standard path for normal characters" do
      tag = Tag.new(:name => "normal")
      helper.tag_path(tag).should == "/tags/normal"
    end

    it "should escape invalid url characters" do
      tag = Tag.new(:name => "c++")
      helper.tag_path(tag).should == "/tags/c%2B%2B"
    end

    it "should escape dot (.) characters" do
      tag = Tag.new(:name => ".NET")
      helper.tag_path(tag).should == "/tags/%2ENET"
    end
  end

  it "should be included in the object returned by #helper" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(ApplicationHelper)
  end

end