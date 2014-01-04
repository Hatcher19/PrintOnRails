class AddTwoxToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :twox, :string
  end
end
