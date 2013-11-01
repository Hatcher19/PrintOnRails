class AddAccountIdToOrderCategory < ActiveRecord::Migration
  def change
    add_column :order_categories, :account_id, :integer
    add_index :order_categories, :account_id
  end
end
