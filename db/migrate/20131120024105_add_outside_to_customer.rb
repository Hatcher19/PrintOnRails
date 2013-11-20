class AddOutsideToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :outside, :boolean
  end
end
