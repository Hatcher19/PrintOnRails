class RemoveSizeFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :size
  end

  def down
    add_column :line_items, :size, :string
  end
end
