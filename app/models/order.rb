class Order < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
      
  has_paper_trail

  def admin_permalink
    admin_order_path(self)
  end

  attr_accessible :end_date, :name, :customer_id, :order_category_id, 
  :order_type_id, :order_status_id, :order_priority_id, 
  :line_items_attributes, :admin_user_id, :ship, :artworks_attributes, 
  :product_status_id, :account_id

  has_many :artworks
  has_many :line_items
  belongs_to :customer
  belongs_to :order_category
  belongs_to :order_type
  belongs_to :order_status
  belongs_to :product_status
  belongs_to :admin_user
  belongs_to :account
  accepts_nested_attributes_for :line_items, :allow_destroy => true
  accepts_nested_attributes_for :artworks, :allow_destroy => true
  scope :active, includes(:order_status).where("order_statuses.active = ?", true)
  scope :hold, includes(:order_status).where("order_statuses.id = ?", 7)

  def default_values
    if new_record?
      self.start_date ||= Date.today
      self.number ||= (Order.maximum(:number) + 1 rescue 1)
    end
  end
end
