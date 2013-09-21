class RemoveWhiteboardAndColorFrontAndColorBackAndColorSleeveAndArtworkAndProofAndNumberAndAssigneeIdFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :whiteboard
    remove_column :orders, :color_front
    remove_column :orders, :color_back
    remove_column :orders, :color_sleeve
    remove_column :orders, :artwork
    remove_column :orders, :proof
    remove_column :orders, :number
    remove_column :orders, :assignee_id
  end

  def down
    add_column :orders, :assignee_id, :integer
    add_column :orders, :number, :integer
    add_column :orders, :proof, :string
    add_column :orders, :artwork, :string
    add_column :orders, :color_sleeve, :string
    add_column :orders, :color_back, :string
    add_column :orders, :color_front, :string
    add_column :orders, :whiteboard, :text
  end
end
