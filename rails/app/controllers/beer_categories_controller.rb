class BeerCategoriesController < ApplicationController
  def index
    render json: BeerCategory.all
  end
end
