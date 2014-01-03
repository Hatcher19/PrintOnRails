class Artwork < ActiveRecord::Base
	attr_accessible :file, :order_id, :color, :location_id
	mount_uploader :file, ArtworkUploader
	belongs_to :order
	belongs_to :location
	validates :file, :presence => true
	validates :color, :presence => true
	validates :location_id, :presence => true
	accepts_nested_attributes_for :location
end
