class RemoveFourxFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :fourx
  end

  def down
    add_column :line_items, :fourx, :string
  end
end
