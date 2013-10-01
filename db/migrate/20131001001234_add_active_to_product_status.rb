class AddActiveToProductStatus < ActiveRecord::Migration
  def change
    add_column :product_statuses, :active, :boolean
  end
end
