class AddThreexToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :threex, :string
  end
end
