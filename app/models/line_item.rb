class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :style, :color, :order_id, 
  :xs, :s, :m, :l, :xl, :xxl, :xxxl, :xxxxl, :vxl, :vixl
  belongs_to :order
end
