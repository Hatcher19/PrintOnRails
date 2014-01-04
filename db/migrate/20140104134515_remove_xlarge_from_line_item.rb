class RemoveXlargeFromLineItem < ActiveRecord::Migration
  def up
    remove_column :line_items, :xlarge
  end

  def down
    add_column :line_items, :xlarge, :string
  end
end
