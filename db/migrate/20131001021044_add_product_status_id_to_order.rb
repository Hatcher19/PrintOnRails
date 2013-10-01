class AddProductStatusIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :product_status_id, :integer
    add_index :orders, :product_status_id
  end
end
