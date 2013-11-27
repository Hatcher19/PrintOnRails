class Artwork < ActiveRecord::Base
  attr_accessible :file, :order_id, :color, :print_location_id

  mount_uploader :file, ArtworkUploader


  belongs_to :order
  belongs_to :print_location
end
