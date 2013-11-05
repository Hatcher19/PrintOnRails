class RemovePrintLocationIdFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :print_location_id
  end

  def down
    add_column :orders, :print_location_id, :integer
  end
end
