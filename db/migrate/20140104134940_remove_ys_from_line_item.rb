class RemoveYsFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :ys
  end

  def down
    add_column :line_items, :ys, :integer
  end
end
