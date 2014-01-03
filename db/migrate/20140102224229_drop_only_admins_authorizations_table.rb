class DropOnlyAdminsAuthorizationsTable < ActiveRecord::Migration
  def up
    drop_table :only_admins_authorizations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
