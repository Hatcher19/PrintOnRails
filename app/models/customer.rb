class Customer < ActiveRecord::Base
 	attr_accessible :name, :email, :phone, :addresses_attributes, :company
  has_many :addresses
  accepts_nested_attributes_for :addresses, :allow_destroy => true
end
