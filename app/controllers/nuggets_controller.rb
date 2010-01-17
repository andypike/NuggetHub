class NuggetsController < ApplicationController
  load_and_authorize_resource  

  def new
    @nugget = Nugget.new
  end

  def create
    @nugget = Nugget.new(params[:nugget])
    @nugget.user = current_user
    
    if @nugget.save
      flash[:notice] = "Your Nugget was successfully posted"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
