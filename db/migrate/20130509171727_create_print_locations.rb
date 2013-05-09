class CreatePrintLocations < ActiveRecord::Migration
  def change
    create_table :print_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
