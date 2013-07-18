class Customer < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :addresses_attributes, :company, :admin_user_id
  
  has_many :addresses
  has_many :orders, :dependent => :nullify
  belongs_to :admin_user
  accepts_nested_attributes_for :addresses, :allow_destroy => true

  validates :phone, :length => { :is => 10 }
end