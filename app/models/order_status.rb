class OrderStatus < ActiveRecord::Base
  attr_accessible :name, :active
  has_many :orders
  validates :name, :presence => true
  default_scope order("lower(name) asc")
  scope :active, where("active = ?", true)
  scope :closed, where("active = ?", false)
end
