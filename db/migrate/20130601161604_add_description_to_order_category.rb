class AddDescriptionToOrderCategory < ActiveRecord::Migration
  def change
    add_column :order_categories, :description, :text
  end
end
