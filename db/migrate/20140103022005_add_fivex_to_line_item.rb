class AddFivexToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :fivex, :string
  end
end
