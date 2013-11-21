class AddArtStatusIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :art_status_id, :integer
  end
end
