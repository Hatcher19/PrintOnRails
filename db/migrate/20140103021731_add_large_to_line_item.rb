class AddLargeToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :large, :string
  end
end
