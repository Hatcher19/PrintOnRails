class AddColorToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :color, :string
  end
end
