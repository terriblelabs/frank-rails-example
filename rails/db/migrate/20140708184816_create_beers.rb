class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :beer_category_id

      t.timestamps
    end
  end
end
