class AdminUser < ActiveRecord::Base

	ROLES = %w(admin sales broker production art shipping)

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone, :role
  # attr_accessible :title, :body

   has_many :orders, :dependent => :destroy

  def role?(permission)
    self.role == permission.to_s.downcase
  end

  def admin?
    role? :admin
  end

  def sales?
    role? :sales
  end

  def production?
    role? :production
  end

  def broker?
    role? :broker
  end

    def art?
    role? :art
  end

  def shipping?
    role? :shipping
  end
end
