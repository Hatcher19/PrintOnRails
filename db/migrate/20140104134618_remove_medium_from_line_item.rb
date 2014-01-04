class RemoveMediumFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :medium
  end

  def down
    add_column :line_items, :medium, :string
  end
end
