class ProductStatus < ActiveRecord::Base
  attr_accessible :name, :active
  has_many :orders
  validates :name, :presence => true

  scope :active, where("active = ?", true)
  scope :closed, where("active = ?", false)
end
