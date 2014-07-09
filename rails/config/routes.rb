Rails.application.routes.draw do
  resources :beer_categories, only: [:index] do
    resources :beers, only: [:index]
  end
end
