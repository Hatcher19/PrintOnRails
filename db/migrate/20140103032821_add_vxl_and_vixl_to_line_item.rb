class AddVxlAndVixlToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :vxl, :integer
    add_column :line_items, :vixl, :integer
  end
end
