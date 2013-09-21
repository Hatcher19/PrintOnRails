class AddActiveToOrderStatus < ActiveRecord::Migration
  def change
    add_column :order_statuses, :active, :boolean
  end
end
