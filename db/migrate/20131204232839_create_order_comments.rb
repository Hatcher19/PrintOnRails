class CreateOrderComments < ActiveRecord::Migration
  def change
    create_table :order_comments do |t|

      t.timestamps
    end
  end
end
