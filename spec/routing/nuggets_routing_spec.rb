require 'spec_helper'

describe NuggetsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/nuggets" }.should route_to(:controller => "nuggets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/nuggets/new" }.should route_to(:controller => "nuggets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/nuggets/1" }.should route_to(:controller => "nuggets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/nuggets/1/edit" }.should route_to(:controller => "nuggets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/nuggets" }.should route_to(:controller => "nuggets", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/nuggets/1" }.should route_to(:controller => "nuggets", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/nuggets/1" }.should route_to(:controller => "nuggets", :action => "destroy", :id => "1") 
    end
  end
end
