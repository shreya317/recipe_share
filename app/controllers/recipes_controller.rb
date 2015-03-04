class RecipesController < ApplicationController
  require 'DATE'

	def index
    @recipes = Recipe.all
  end

  def my_recipes
    @recipes = Recipe.where(user_id: current_user.id)
    @current_user = current_user.id
  end

  def chef_recipes
    @recipes = Recipe.where(user_id: params[:user_id])
    @current_user = current_user
  end


  def new
    @user = current_user
    @recipe = Recipe.new(user_id: @user)
	end

	def create
    @recipe = Recipe.new( title: params[:recipe][:title],
                          user_id: current_user.id,
                          date_posted: Date.today,
                          description: @description,
                          ingredients: params[:recipe][:ingredients],
                          directions: params[:recipe][:directions] )

    if @recipe.save
      redirect_to user_recipe_path(current_user.id,@recipe.id)
    else
      render :new
    end
	end

  def show
    @current_user = current_user.id
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_my_recipes_path(current_user.id)
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(update_params)
    redirect_to user_recipe_path(@recipe.user_id, @recipe.id)
  end

  private

  def update_params
    params.require(:recipe).permit(:title, :description, :ingredients, :directions)
  end

end
