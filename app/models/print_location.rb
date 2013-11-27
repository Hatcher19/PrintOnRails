class PrintLocation < ActiveRecord::Base
  attr_accessible :name
  
  has_many :artworks
  validates :name, :presence => true
end