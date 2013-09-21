class RemoveStartDateFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :start_date
  end

  def down
    add_column :orders, :start_date, :date
  end
end
