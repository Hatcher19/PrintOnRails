class RemoveTwoxFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :twox
  end

  def down
    add_column :line_items, :twox, :string
  end
end
