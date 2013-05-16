class RemoveArtworkAndProofFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :artwork
    remove_column :orders, :proof
  end

  def down
    add_column :orders, :proof, :string
    add_column :orders, :artwork, :string
  end
end
