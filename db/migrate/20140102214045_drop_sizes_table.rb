class DropSizesTable < ActiveRecord::Migration
  def up
    drop_table :sizes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
