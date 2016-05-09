class CreateSuburbs < ActiveRecord::Migration

  def change
    create_table :suburbs do |t|
    t.string :suburb_name
    t.string :geocode
    t.integer :median_price_house
    t.integer :median_price_unit
    end

  end
end
