class RemoveYmFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :ym
  end

  def down
    add_column :line_items, :ym, :integer
  end
end
