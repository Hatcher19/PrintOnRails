class LineItem < ActiveRecord::Base
  attr_accessible :color, :l, :m, :quantity, :s, :style, :xl, :order_id, :yxs, :ys, :ym, :yl, :yxl, :xs, :xxl, :xxxl, :xxxxl
  belongs_to :order
end
