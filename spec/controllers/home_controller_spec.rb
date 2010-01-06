require 'spec_helper'

describe HomeController do

  context "GET 'index'" do
    it "should be successful" do
      get 'index'

      response.should be_success
      response.should render_template("home/index.html.erb")
    end
  end

end
