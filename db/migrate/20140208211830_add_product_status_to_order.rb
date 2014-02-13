class AddProductStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :product_status, :string
  end
end
