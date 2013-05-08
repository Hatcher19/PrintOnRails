class AddOrderCategoryIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_category_id, :integer
    add_index :orders, :order_category_id
  end
end
