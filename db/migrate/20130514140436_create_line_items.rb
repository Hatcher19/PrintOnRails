class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.string :style
      t.string :color
      t.integer :s
      t.integer :m
      t.integer :l
      t.integer :xl

      t.timestamps
    end
  end
end
