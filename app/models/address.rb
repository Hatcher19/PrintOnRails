class Address < ActiveRecord::Base

	ADD = %w(billing shipping)
	

	attr_accessible :street, :city, :state, :zip, :customer_id, :address_name, :same_as_billing, :address_type
  belongs_to :customer
end
