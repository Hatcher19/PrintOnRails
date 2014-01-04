class AddSizexToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :sixx, :string
  end
end
