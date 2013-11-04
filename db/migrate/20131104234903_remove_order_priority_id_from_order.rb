class RemoveOrderPriorityIdFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :order_priority_id
  end

  def down
    add_column :orders, :order_priority_id, :integer
  end
end
