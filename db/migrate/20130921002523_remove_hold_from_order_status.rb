class RemoveHoldFromOrderStatus < ActiveRecord::Migration
  def up
    remove_column :order_statuses, :hold
  end

  def down
    add_column :order_statuses, :hold, :boolean
  end
end
