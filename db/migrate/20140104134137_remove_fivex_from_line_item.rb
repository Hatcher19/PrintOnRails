class RemoveFivexFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :fivex
  end

  def down
    add_column :line_items, :fivex, :string
  end
end
