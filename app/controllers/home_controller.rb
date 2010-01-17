class HomeController < ApplicationController
  def index
    @nuggets = Nugget.all
  end
end
