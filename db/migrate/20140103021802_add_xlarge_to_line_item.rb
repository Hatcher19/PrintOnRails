class AddXlargeToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :xlarge, :string
  end
end
