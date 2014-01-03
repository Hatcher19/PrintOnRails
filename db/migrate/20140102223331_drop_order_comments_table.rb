class DropOrderCommentsTable < ActiveRecord::Migration
  def up
    drop_table :order_comments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
