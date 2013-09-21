class RemoveDescriptionFromOrderType < ActiveRecord::Migration
  def up
    remove_column :order_types, :description
  end

  def down
    add_column :order_types, :description, :text
  end
end
