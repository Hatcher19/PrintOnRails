class Customer < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :addresses_attributes, :company, :admin_user_id
  
  has_many :addresses
  has_many :orders, :dependent => :nullify
  belongs_to :admin_user
  accepts_nested_attributes_for :addresses, :allow_destroy => true

  validates :name, :presence => true  
  validates :phone, format: { with: /\d{7,10}/, message: "not a valid phone number" }
  validates :email, email_format: { message: "Doesn't look like an email address" }

end