class RemoveDescriptionFromOrderCategory < ActiveRecord::Migration
  def up
    remove_column :order_categories, :description
  end

  def down
    add_column :order_categories, :description, :text
  end
end
