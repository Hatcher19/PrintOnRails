class AddNewUserToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :new_user, :boolean
  end
end
