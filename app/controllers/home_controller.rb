class HomeController < ApplicationController
  def index
    @nuggets = Nugget.all(:order => "updated_at DESC")
  end
end
