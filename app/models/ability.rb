class Ability
  include CanCan::Ability
  def initialize(user)
    return if user.nil? #non logged in user can use this.
    case 
      when user.super_admin?
        can :manage, :all
      when user.account_admin?
        can :manage, :all
        cannot :destroy, :all
      when user.admin?
        can :manage, :all
        cannot :manage, Account
        cannot :destroy, :all
      when user.office?
        can :manage, [Customer, Order, AdminUser]
        cannot :manage, [Account]
        cannot :destroy, :all
      when user.warehouse?
        can :read, :all #I use this so this role can view information.
        can :update, Order
        cannot :update, [Customer, AdminUser]
        cannot :create, :all
        cannot :destroy, :all
      when user.broker?
        can :manage, [Order, Customer], :user_id => user.id
        cannot :update, Order
        cannot :destroy, :all
      when user.nil?
        can :create, [Account, AdminUser]
    end
  end
end
