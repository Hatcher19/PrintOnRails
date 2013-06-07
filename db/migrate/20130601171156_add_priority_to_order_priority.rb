class AddPriorityToOrderPriority < ActiveRecord::Migration
  def change
    add_column :order_priorities, :priority, :string
    add_index :order_priorities, :priority
  end
end
