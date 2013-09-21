class RemoveDescriptionAndPriorityFromOrderPriority < ActiveRecord::Migration
  def up
    remove_column :order_priorities, :description
    remove_column :order_priorities, :priority
  end

  def down
    add_column :order_priorities, :priority, :string
    add_column :order_priorities, :description, :text
  end
end
