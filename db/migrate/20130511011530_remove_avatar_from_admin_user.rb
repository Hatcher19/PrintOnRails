class RemoveAvatarFromAdminUser < ActiveRecord::Migration
  def up
    remove_column :admin_users, :avatar
  end

  def down
    add_column :admin_users, :avatar, :string
  end
end
