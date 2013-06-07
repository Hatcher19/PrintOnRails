class OrderPriority < ActiveRecord::Base

	PRIORITY = %w(lowest low mid high highest)
	
  attr_accessible :name, :priority, :description
  has_many :orders  
end
