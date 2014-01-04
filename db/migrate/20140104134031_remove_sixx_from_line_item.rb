class RemoveSixxFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :sixx
  end

  def down
    add_column :line_items, :sixx, :string
  end
end
