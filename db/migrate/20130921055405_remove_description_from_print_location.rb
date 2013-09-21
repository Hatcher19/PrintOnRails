class RemoveDescriptionFromPrintLocation < ActiveRecord::Migration
  def up
    remove_column :print_locations, :description
  end

  def down
    add_column :print_locations, :description, :text
  end
end
