class RemoveOutsideFromCustomer < ActiveRecord::Migration
  def up
    remove_column :customers, :outside
  end

  def down
    add_column :customers, :outside, :boolean
  end
end
