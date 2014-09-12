class AnimalCategoryController < ApplicationController

  def index
    @animal_category = AnimalCategory.all
    respond_to do |format|
      format.json { render json: @animal_category, root: false}
    end
  end
  def show
    @animal_category = AnimalCategory.find(params[:id])
    respond_to do |format|
      format.json { render json:@animal_category , root: false}
    end
  end

end
