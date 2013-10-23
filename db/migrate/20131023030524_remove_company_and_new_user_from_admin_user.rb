class RemoveCompanyAndNewUserFromAdminUser < ActiveRecord::Migration
  def up
    remove_column :admin_users, :company
    remove_column :admin_users, :new_user
  end

  def down
    add_column :admin_users, :new_user, :boolean
    add_column :admin_users, :company, :string
  end
end
