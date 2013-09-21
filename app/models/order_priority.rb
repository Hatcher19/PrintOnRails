class OrderPriority < ActiveRecord::Base

	WEIGHTS = %w(high medium low)
	
  attr_accessible :name, :weight
  has_many :orders 
  validates :name, :presence => true
  validates :weight, :presence => true 
end