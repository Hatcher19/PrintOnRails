class AdminUser < ActiveRecord::Base

  ROLES = %w(Admin Sales Broker Production Art Shipping/Receiving)


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable,
         :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone, :role
  # attr_accessible :title, :body

  has_many :orders, :dependent => :destroy
  has_many :customers, :dependent => :destroy
  belongs_to :account

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true
  validates :phone, :presence => true
  validates :email, email_format: { message: "Doesn't look like an email address" }
  validates :role, :presence => true

  def role?(permission)
    self.role == permission.to_s.downcase
  end

  def admin?
    role? :admin
  end

  def broker?
    role? :broker
  end

  def sales?
    role? :sales
  end

  def production?
    role? :production
  end

  def art?
    role? :art
  end
  
  def shipping?
    role? :shipping
  end
end
