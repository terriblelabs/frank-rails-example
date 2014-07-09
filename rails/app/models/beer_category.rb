class BeerCategory < ActiveRecord::Base
  has_many :beers
end
