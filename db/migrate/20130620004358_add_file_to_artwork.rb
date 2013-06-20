class AddFileToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :file, :string
    add_index :artworks, :file
  end
end
