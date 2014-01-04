class AddMediumToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :medium, :string
  end
end
