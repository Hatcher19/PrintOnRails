class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :artwork
      t.integer :order_id

      t.timestamps
    end
    add_index :artworks, :order_id
  end
end
