class Customer < ActiveRecord::Base
	STATE = %w(al ak az ar ca co ct de fl ga hi id il in ia ks ky la me md ma mi mn ms mo mt ne nv nh nj nm ny nc nd oh ok or pa ri sc sd tn tx ut vt va wa wv wi wy)
  attr_accessible :name, :email, :phone, :addresses_attributes, :admin_user_id, :account_id, :company,
  :street, :city, :state, :zip, :unit
  
  has_many :addresses
  has_many :orders, :dependent => :nullify
  belongs_to :admin_user
  belongs_to :account
  accepts_nested_attributes_for :addresses, :allow_destroy => true

  validates :name, :presence => true
  validates :email, email_format: { message: "Doesn't look like an email address" }
  validates :company, :presence => true
end
