class AddAdminUserIdToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :admin_user_id, :integer
    add_index :accounts, :admin_user_id
  end
end
