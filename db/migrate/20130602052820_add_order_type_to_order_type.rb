class AddOrderTypeToOrderType < ActiveRecord::Migration
  def change
    add_column :order_types, :order_type, :boolean
  end
end
