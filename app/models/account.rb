class Account < ActiveRecord::Base
  attr_accessible :company, :admin_user_id, :admin_users_attributes

  has_many :admin_users
  accepts_nested_attributes_for :admin_users, :allow_destroy => true
end
