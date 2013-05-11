class AddArtworkToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :artwork, :string
  end
end
