class Order < ActiveRecord::Base
  attr_accessible :color_back, :color_front, :color_sleeve, :end_date, :name, :start_date, :whiteboard, :customer_id, :order_category_id
  belongs_to :customer
  belongs_to :order_category
end
