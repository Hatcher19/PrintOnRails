class RemoveYlFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :yl
  end

  def down
    add_column :line_items, :yl, :integer
  end
end
