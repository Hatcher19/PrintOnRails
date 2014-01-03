class DropArtsTable < ActiveRecord::Migration
  def up
    drop_table :arts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
