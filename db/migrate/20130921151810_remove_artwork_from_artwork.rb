class RemoveArtworkFromArtwork < ActiveRecord::Migration
  def up
    remove_column :artworks, :artwork
  end

  def down
    add_column :artworks, :artwork, :string
  end
end
