class BeerCategoriesController < UITableViewController

  BEER_CATEGORIES_CELL_ID = "BeerCategoriesCell"

  def viewDidLoad
    super

    self.title = "Beer Categories"

    load_data

    view.delegate = self
    view.dataSource = self
  end

  def load_data
    @data = []
    AFMotion::JSON.get("http://#{ENV['API_HOST']}/beer_categories") do |beer_categories|
      @data = beer_categories.object || []
      view.reloadData
    end
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    60
  end

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    category = @data[index_path.row]

    AFMotion::JSON.get("http://#{ENV['API_HOST']}/beer_categories/#{category["id"]}/beers") do |response|
      navigationController.pushViewController BeersController.alloc.initWithBeers(response.object), animated: true
    end

  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = @data[index_path.row]

    cell = table_view.dequeueReusableCellWithIdentifier(BEER_CATEGORIES_CELL_ID) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: BEER_CATEGORIES_CELL_ID)
    cell.text = data_row['name']
    cell
  end
end

