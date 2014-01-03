class AddLocationIdToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :location_id, :integer
  end
end
