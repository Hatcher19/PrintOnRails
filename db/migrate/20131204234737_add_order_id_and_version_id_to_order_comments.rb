class AddOrderIdAndVersionIdToOrderComments < ActiveRecord::Migration
  def change
    add_column :order_comments, :order_id, :integer
    add_index :order_comments, :order_id
    add_column :order_comments, :version_id, :integer
    add_index :order_comments, :version_id
  end
end
