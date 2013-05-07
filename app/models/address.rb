class Address < ActiveRecord::Base
	attr_accessible :street, :city, :state, :zip, :customer_id
  belongs_to :customer
end
