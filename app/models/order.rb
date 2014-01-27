class Order < ActiveRecord::Base
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  include ActivityHelper
      
  has_paper_trail

  def admin_permalink
    admin_order_path(self)
  end

  attr_accessible :end_date, :name, :customer_id, :order_category_id, 
  :order_type_id, :order_status_id, :order_priority_id, 
  :line_items_attributes, :admin_user_id, :ship, :artworks_attributes, 
  :product_status_id, :account_id, :art_status_id, :guid

  has_many :artworks
  has_many :line_items
  belongs_to :customer
  belongs_to :order_category
  belongs_to :order_type
  belongs_to :order_status
  belongs_to :art_status
  belongs_to :product_status
  belongs_to :admin_user
  belongs_to :account
  accepts_nested_attributes_for :line_items, :allow_destroy => true
  accepts_nested_attributes_for :artworks, :allow_destroy => true
  scope :active, includes(:order_status).where("order_statuses.active = ?", true)
  scope :hold, includes(:order_status).where("order_statuses.id = ?", 4)

  validates :name, :presence => true
  validates :end_date, :presence => true
  validates :customer_id, :presence => true
  validates :order_category_id, :presence => true
  validates :order_type_id, :presence => true
  validates :ship, :inclusion => {:in => [true, false]}
  validates :product_status_id, :presence => true

  before_create :generate_guid

  def default_values
    if new_record?
      self.start_date ||= Date.today
    end
  end

  def generate_guid
    self.guid = account.orders.count + 1

  end
end
