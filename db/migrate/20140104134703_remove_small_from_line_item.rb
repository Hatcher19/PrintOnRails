class RemoveSmallFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :small
  end

  def down
    add_column :line_items, :small, :string
  end
end
