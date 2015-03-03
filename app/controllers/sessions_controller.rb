class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to recipes_index_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end


end
