class CreateOrderPriorities < ActiveRecord::Migration
  def change
    create_table :order_priorities do |t|
      t.string :name

      t.timestamps
    end
  end
end
