class AddFirstAndLastAndCompanyToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :first, :string
    add_column :admin_users, :last, :string
    add_column :admin_users, :company, :string
  end
end
