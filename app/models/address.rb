class Address < ActiveRecord::Base

	TYPES = %w(billing shipping)

	attr_accessible :street, :city, :state, :zip, :customer_id, :address_name, :address_type
  belongs_to :customer
end
