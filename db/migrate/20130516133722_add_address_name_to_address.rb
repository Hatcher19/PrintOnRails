class AddAddressNameToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :address_name, :string
  end
end
