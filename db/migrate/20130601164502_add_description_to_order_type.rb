class AddDescriptionToOrderType < ActiveRecord::Migration
  def change
    add_column :order_types, :description, :text
  end
end
