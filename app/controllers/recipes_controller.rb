class RecipesController < ApplicationController
  require 'DATE'

	def index
    @recipes = Recipe.all
  end


  def new
    @recipe = Recipe.new
	end

	def create
    @recipe = Recipe.new( title: params[:recipe][:title],
                          user_id: current_user.id,
                          date_posted: Date.today,
                          description: params[:recipe][:description],
                          ingredients: params[:recipe][:ingredients],
                          directions: params[:recipe][:directions] )

    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end
	end

  def show
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
