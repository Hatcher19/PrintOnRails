class Account < ActiveRecord::Base
  attr_accessible :subdomain

  has_many :admin_users
end
