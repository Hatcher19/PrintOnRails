class RemoveYxsFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :yxs
  end

  def down
    add_column :line_items, :yxs, :integer
  end
end
