class AddDescriptionToOrderStatus < ActiveRecord::Migration
  def change
    add_column :order_statuses, :description, :text
  end
end
