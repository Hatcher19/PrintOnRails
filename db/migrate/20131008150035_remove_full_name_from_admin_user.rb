class RemoveFullNameFromAdminUser < ActiveRecord::Migration
  def up
    remove_column :admin_users, :full_name
  end

  def down
    add_column :admin_users, :full_name, :string
  end
end
