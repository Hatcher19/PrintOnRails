class LineItem < ActiveRecord::Base
  attr_accessible :color, :l, :m, :quantity, :s, :style, :xl, :order_id
  belongs_to :order
end
