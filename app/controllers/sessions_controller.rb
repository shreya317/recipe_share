class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to recipes_path
    else
      redirect_to welcome_index_path
    end
  end

  def destroy
    session.clear
    redirect_to welcome_index_path
  end


end
