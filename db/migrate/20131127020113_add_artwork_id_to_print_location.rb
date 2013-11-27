class AddArtworkIdToPrintLocation < ActiveRecord::Migration
  def change
    add_column :print_locations, :artwork_id, :integer
    add_index :print_locations, :artwork_id
  end
end
