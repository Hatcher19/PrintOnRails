class RemoveStatusFromOrderStatus < ActiveRecord::Migration
  def up
    remove_column :order_statuses, :status
  end

  def down
    add_column :order_statuses, :status, :boolean
  end
end
