class RemovePrintLocationIdFromArtworks < ActiveRecord::Migration
  def up
    remove_column :artworks, :print_location_id
  end

  def down
    add_column :artworks, :print_location_id, :integer
  end
end
