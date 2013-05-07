class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.text :whiteboard
      t.string :color_front
      t.string :color_back
      t.string :color_sleeve

      t.timestamps
    end
  end
end
