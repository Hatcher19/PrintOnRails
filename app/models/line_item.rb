class LineItem < ActiveRecord::Base
  attr_accessible :color, :l, :m, :quantity, :s, :style, :xl, :order_id, 
  :yxs, :ys, :ym, :yl, :yxl, :xs, :xxl, :xxxl, :xxxxl, :size
  belongs_to :order
end
