class Artwork < ActiveRecord::Base
  attr_accessible :file, :order_id, :location

  mount_uploader :file, ArtworkUploader

  belongs_to :order
end