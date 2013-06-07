class AddAddressTypeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :address_type, :string
    add_index :addresses, :address_type
  end
end
