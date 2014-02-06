class AddFirstTimeToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :first_time, :boolean
  end
end
