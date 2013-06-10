class OrderPriority < ActiveRecord::Base

	WEIGHTS = %w(lowest low mid high highest)
	
  attr_accessible :name, :weight, :description
  has_many :orders  
end
