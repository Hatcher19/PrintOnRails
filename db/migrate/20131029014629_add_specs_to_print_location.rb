class AddSpecsToPrintLocation < ActiveRecord::Migration
  def change
    add_column :print_locations, :specs, :text
  end
end
