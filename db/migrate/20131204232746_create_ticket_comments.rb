class CreateTicketComments < ActiveRecord::Migration
  def change
    create_table :ticket_comments do |t|

      t.timestamps
    end
  end
end
