class AdminUser < ActiveRecord::Base

  ROLES = %w(admin broker office warehouse)


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable,
         :registerable
  attr_accessible :email, :password, :password_confirmation, 
  :remember_me, :role, :admin_user_id, :first, :last, :company, :phone, :account_id

  has_many :orders, :dependent => :destroy
  has_many :customers, :dependent => :destroy
  belongs_to :account


  validates :first, :presence => true
  validates :last, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :email, email_format: { message: "Doesn't look like an email address" }
  validates :role, :presence => true

  def role?(permission)
    self.role == permission.to_s.downcase
  end

  def super_admin?
    role? :super_admin
  end

  def admin?
    role? :admin
  end

  def broker?
    role? :broker
  end

  def office?
    role? :office
  end

  def warehouse?
    role? :warehouse
  end
end
