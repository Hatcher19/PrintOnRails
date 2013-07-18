class OrderCategory < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :orders
  validates :name, :presence => true
end
