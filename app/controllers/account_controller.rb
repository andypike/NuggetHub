class AccountController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "Hello #{@user.full_name}, welcome to NuggetHub."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    
  end
end
