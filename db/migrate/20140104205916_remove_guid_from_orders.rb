class RemoveGuidFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :guid
  end

  def down
    add_column :orders, :guid, :integer
  end
end
