class AddOrderIdToArt < ActiveRecord::Migration
  def change
    add_column :arts, :order_id, :integer
    add_index :arts, :order_id
  end
end
