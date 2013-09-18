class AddShipToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :ship, :boolean
  end
end
