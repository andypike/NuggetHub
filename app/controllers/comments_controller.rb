class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(params[:comment])
    @nugget = Nugget.find(params[:nugget_id])

    @comment.user = current_user
    @comment.nugget = @nugget

    if @comment.save
      flash[:notice] = "Your comment was successfully posted"
    else
      flash[:error] = "Unable to save your comment, was it empty?"
    end

    redirect_to nugget_path @nugget
  end

end