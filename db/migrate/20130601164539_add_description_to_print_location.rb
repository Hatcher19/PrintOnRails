class AddDescriptionToPrintLocation < ActiveRecord::Migration
  def change
    add_column :print_locations, :description, :text
  end
end
