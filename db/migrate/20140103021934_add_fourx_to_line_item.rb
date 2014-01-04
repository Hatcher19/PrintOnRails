class AddFourxToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :fourx, :string
  end
end
