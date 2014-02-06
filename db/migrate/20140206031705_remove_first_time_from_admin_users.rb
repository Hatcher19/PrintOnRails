class RemoveFirstTimeFromAdminUsers < ActiveRecord::Migration
  def up
    remove_column :admin_users, :first_time
  end

  def down
    add_column :admin_users, :first_time, :boolean
  end
end
