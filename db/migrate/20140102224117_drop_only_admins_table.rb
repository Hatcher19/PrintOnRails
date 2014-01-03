class DropOnlyAdminsTable < ActiveRecord::Migration
  def up
    drop_table :only_admins
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
