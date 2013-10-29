class RemoveSpecsFromPrintLocations < ActiveRecord::Migration
  def up
    remove_column :print_locations, :specs
  end

  def down
    add_column :print_locations, :specs, :text
  end
end
