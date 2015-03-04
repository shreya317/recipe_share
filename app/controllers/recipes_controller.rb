class RecipesController < ApplicationController
  require 'DATE'

	def index
    @recipes = Recipe.all
    @current_user = current_user.id
  end

  def my_recipes
    @recipes = Recipe.where(user_id: current_user.id)
    @current_user = current_user.id
  end


  def new
    @user = current_user
    @recipe = Recipe.new(user_id: @user)
	end

	def create
    @recipe = Recipe.new( title: params[:recipe][:title],
                          user_id: current_user.id,
                          date_posted: Date.today,
                          description: params[:recipe][:description],
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
    redirect_to recipes_path
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(update_params)
    redirect_to redirect_to recipes_path(@recipe.id)
  end

  private

  def update_params
    params.require(:recipe).permit(:title, :description, :ingredients, :directions)
  end

end
