class RemoveSubdomainFromAdminUser < ActiveRecord::Migration
  def up
    remove_column :admin_users, :subdomain
  end

  def down
    add_column :admin_users, :subdomain, :string
  end
end
