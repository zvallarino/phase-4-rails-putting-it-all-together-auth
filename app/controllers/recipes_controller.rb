class RecipesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid_error
rescue_from ActiveRecord::RecordNotFound, with: :records_nowhere

  def index
    recipe = Recipe.all
    render json: recipe
  end 

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id = session[:user_id]
    recipe.save!
    render json: recipe, status:201
  end 

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end 

  def invalid_error(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status:422  
  end
  
  def records_nowhere(dog)
    render json: { errors: dog.record.errors.full_messages }, status:401
  end

end
