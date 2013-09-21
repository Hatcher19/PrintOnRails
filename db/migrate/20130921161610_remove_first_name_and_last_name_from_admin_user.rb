class RemoveFirstNameAndLastNameFromAdminUser < ActiveRecord::Migration
  def up
    remove_column :admin_users, :first_name
    remove_column :admin_users, :last_name
  end

  def down
    add_column :admin_users, :last_name, :string
    add_column :admin_users, :first_name, :string
  end
end
