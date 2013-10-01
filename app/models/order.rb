class Order < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
      
  has_paper_trail :on => [:create, :update, :destroy]

  def admin_permalink
    admin_order_path(self)
  end

  attr_accessible :end_date, :name, :customer_id, :order_category_id, 
  :order_type_id, :order_status_id, :order_priority_id, :print_location_id, 
  :line_items_attributes, :admin_user_id, :ship, :artworks_attributes, 
  :product_status_id

  has_many :artworks
  has_many :line_items
  belongs_to :customer
  belongs_to :order_category
  belongs_to :order_type
  belongs_to :order_status
  belongs_to :product_status
  belongs_to :order_priority
  belongs_to :print_locations
  belongs_to :admin_user
  accepts_nested_attributes_for :line_items, :allow_destroy => true
  accepts_nested_attributes_for :artworks, :allow_destroy => true

  

  validates :name, :presence => true 
  validates :order_category, :presence => true 
  validates :customer, :presence => true   
  validates :order_type, :presence => true 
  validates :order_status, :presence => true
  validates :product_status, :presence => true 
  validates :order_priority, :presence => true
  validates :end_date, :presence => true
  validates :ship, :inclusion => {:in => [true, false]} 

  def default_values
    if new_record?
      self.start_date ||= Date.today
      self.number ||= (Order.maximum(:number) + 1 rescue 1)
    end
  end
end
