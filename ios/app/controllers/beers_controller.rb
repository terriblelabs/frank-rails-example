class BeersController < UITableViewController

  BEER_CELL_ID = "BeerCell"

  def initWithBeers(beers)
    self.init
    @data = beers
    self
  end

  def viewDidLoad
    super

    self.title = "Beers"

    view.delegate = self
    view.dataSource = self
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    60
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = @data[index_path.row]

    cell = table_view.dequeueReusableCellWithIdentifier(BEER_CELL_ID) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: BEER_CELL_ID)
    cell.text = data_row['name']
    cell
  end
end

