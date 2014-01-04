class RemoveYxlFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :yxl
  end

  def down
    add_column :line_items, :yxl, :integer
  end
end
