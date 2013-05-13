class Order < ActiveRecord::Base
  attr_accessible :color_back, :color_front, :color_sleeve, :end_date, :name, :start_date, :whiteboard, :customer_id, :order_category_id, :order_type_id, :order_status_id, :order_priority_id, :print_location_id, :artwork, :proof
  
  mount_uploader :artwork, ArtworkUploader
  mount_uploader :proof, ProofUploader



  belongs_to :customer
  belongs_to :order_category
  belongs_to :order_type
  belongs_to :order_status
  belongs_to :order_priority
  belongs_to :print_location
end
