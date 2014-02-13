class AddArtStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :art_status, :string
  end
end
