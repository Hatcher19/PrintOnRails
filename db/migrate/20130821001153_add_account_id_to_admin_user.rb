class AddAccountIdToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :account_id, :integer
  end
end
