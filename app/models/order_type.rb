class OrderType < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :orders
end
