class AddXsmallToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :xsmall, :string
  end
end
