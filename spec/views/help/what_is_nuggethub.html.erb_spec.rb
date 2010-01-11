require 'spec_helper'

describe "/help/what_is_nuggethub" do
  before(:each) do
    render 'help/what_is_nuggethub'
  end

  it "should have the correct title" do
    response.should have_tag('h1', "What is NuggetHub?")
  end
end
