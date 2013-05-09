class AddOrderPriorityIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_priority_id, :integer
    add_index :orders, :order_priority_id
  end
end
