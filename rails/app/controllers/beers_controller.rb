class BeersController < ApplicationController
  def index
    render json: beer_category.beers
  end

  private
  def beer_category
    BeerCategory.find params[:beer_category_id]
  end
end
