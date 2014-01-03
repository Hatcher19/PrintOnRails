class DropTicketCommentsTable < ActiveRecord::Migration
  def up
    drop_table :ticket_comments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
