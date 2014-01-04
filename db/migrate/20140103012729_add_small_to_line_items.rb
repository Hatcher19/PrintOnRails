class AddSmallToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :small, :string
  end
end
