class RemoveXsmallFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :xsmall
  end

  def down
    add_column :line_items, :xsmall, :string
  end
end
