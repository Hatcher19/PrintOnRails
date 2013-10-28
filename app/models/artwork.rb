class Artwork < ActiveRecord::Base
  attr_accessible :file, :order_id, :location, :color
  LOCATIONS = %w( Back Chest(L) Chest(R) Front Hat Leg(L) Leg(R) Sleeve(L) Sleeve(R) ) #TODO: Delete after db is clear.

  mount_uploader :file, ArtworkUploader


  belongs_to :order
end
