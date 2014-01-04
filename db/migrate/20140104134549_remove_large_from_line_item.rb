class RemoveLargeFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :large
  end

  def down
    add_column :line_items, :large, :string
  end
end
