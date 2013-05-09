class AddOrderTypeIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_type_id, :integer
  end
end
