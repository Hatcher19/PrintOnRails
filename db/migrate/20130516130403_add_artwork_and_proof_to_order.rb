class AddArtworkAndProofToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :artwork, :string
    add_column :orders, :proof, :string
  end
end
