class AddHoldToOrderStatus < ActiveRecord::Migration
  def change
    add_column :order_statuses, :hold, :boolean
  end
end
