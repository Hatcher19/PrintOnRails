class RemoveAddressIdFromCustomers < ActiveRecord::Migration
  def up
    remove_column :customers, :address_id
  end

  def down
    add_column :customers, :address_id, :integer
    add_index :customers, :address_id
  end
end
