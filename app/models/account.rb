class Account < ActiveRecord::Base
  attr_accessible :company, :admin_user_id, :admin_users_attributes

  has_many :admin_users
  has_many :orders
  has_many :customers
  accepts_nested_attributes_for :admin_users, :allow_destroy => true
  validates :company, :presence => true, :uniqueness => true
end
