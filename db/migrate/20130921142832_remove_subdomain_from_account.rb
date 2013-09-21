class RemoveSubdomainFromAccount < ActiveRecord::Migration
  def up
    remove_column :accounts, :subdomain
  end

  def down
    add_column :accounts, :subdomain, :string
  end
end
