class AddAddressIdToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :address_id, :integer
    add_index :customers, :address_id
  end
end
