class OrderPriority < ActiveRecord::Base

	WEIGHTS = %w(low normal high immediate)
	
  attr_accessible :name, :weight
  has_many :orders  
end
