class AddAssigneeIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :assignee_id, :integer
    add_index :orders, :assignee_id
  end
end
