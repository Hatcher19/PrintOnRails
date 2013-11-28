class RemoveTimeZoneFromAdminUser < ActiveRecord::Migration
  def up
    remove_column :admin_users, :time_zone
  end

  def down
    add_column :admin_users, :time_zone, :string
  end
end
