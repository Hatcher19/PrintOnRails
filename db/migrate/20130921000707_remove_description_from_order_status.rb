class RemoveDescriptionFromOrderStatus < ActiveRecord::Migration
  def up
    remove_column :order_statuses, :description
  end

  def down
    add_column :order_statuses, :description, :text
  end
end
