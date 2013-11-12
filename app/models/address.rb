class Address < ActiveRecord::Base

	ADD = %w(billing shipping)
	STATE = %w(al ak az ar ca co ct de fl ga hi id il in ia ks ky la me md ma mi mn ms mo mt ne nv nh nj nm ny nc nd oh ok or pa ri sc sd tn tx ut vt va wa wv wi wy)

	attr_accessible :street, :city, :state, :zip, :customer_id, :address_name, :same_as_billing, :address_type

	belongs_to :customer
end
