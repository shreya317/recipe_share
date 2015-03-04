class UsersController < ApplicationController
	 
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end

	end

  private

	def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
