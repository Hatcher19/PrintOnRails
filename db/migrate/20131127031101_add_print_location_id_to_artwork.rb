class AddPrintLocationIdToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :print_location_id, :integer
    add_index :artworks, :print_location_id
  end
end
