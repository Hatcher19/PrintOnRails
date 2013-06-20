class AddLocationToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :location, :string
  end
end
