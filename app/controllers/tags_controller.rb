class TagsController < ApplicationController
  def show
    @tag_name = params[:id]
    @tagged_nuggets = Nugget.tagged_with(@tag_name, :on => :tags)
    @tags = Nugget.tag_counts_on(:tags)

    respond_to do |format|
      format.html
      format.json { render :json => @tagged_nuggets }
      format.xml { render :xml => @tagged_nuggets }
    end
  end
end