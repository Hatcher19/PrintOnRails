class AddAccountIdToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :account_id, :integer
    add_index :customers, :account_id
  end
end
