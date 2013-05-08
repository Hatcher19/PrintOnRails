class CreateOrderCategories < ActiveRecord::Migration
  def change
    create_table :order_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
