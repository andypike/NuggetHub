require 'spec_helper'

describe HelpController do

  context "GET 'what_is_nuggethub'" do
    it "should be successful" do
      get :what_is_nuggethub
      response.should be_success
      response.should render_template("help/what_is_nuggethub.html.erb")
    end
  end

end
