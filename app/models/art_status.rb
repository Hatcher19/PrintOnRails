class ArtStatus < ActiveRecord::Base
  attr_accessible :name
  has_many :orders
  validates :name, :presence => true
end

