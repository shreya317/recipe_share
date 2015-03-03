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
      redirect_to "/recipes/#{@recipe.id}"
    else
      render :new
    end
	end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
