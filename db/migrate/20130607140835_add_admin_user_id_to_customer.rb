class AddAdminUserIdToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :admin_user_id, :integer
    add_index :customers, :admin_user_id
  end
end
