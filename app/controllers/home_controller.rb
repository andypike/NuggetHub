class HomeController < ApplicationController
  def index
    @nuggets = Nugget.paged_nuggets(params[:page])
  end
end
