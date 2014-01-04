class RemoveThreexFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :threex
  end

  def down
    add_column :line_items, :threex, :string
  end
end
