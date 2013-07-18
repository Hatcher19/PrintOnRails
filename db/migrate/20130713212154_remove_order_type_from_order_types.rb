class RemoveOrderTypeFromOrderTypes < ActiveRecord::Migration
  def up
    remove_column :order_types, :order_types
  end

  def down
    add_column :order_types, :order_types, :boolean
  end
end
