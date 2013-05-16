class Address < ActiveRecord::Base
	attr_accessible :street, :city, :state, :zip, :customer_id, :address_name
  belongs_to :customer
end
