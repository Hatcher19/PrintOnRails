class AddQuantityToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :quantity, :integer
  end
end
