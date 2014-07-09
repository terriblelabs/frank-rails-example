ales = BeerCategory.create! name: "Ales"
lagers = BeerCategory.create! name: "Lagers"
Beer.create! name: "Budweiser", beer_category: lagers
