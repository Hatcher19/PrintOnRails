class RemoveTypeFromAddress < ActiveRecord::Migration
  def up
    remove_column :addresses, :type
  end

  def down
    add_column :addresses, :type, :string
  end
end
