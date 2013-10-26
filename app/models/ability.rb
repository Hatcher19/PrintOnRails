class Ability
  include CanCan::Ability

  def initialize(user)

    return if user.nil? #non logged in user can use this.

    if user.super_admin?
      can :manage, :all
    end

    if user.account_admin?
      #can :manage, Order, :account_id => user.order.account.id #scopes to account 
      can :manage, :all
      cannot :destroy, [Customer, Order, AdminUser, Account]
    end

    if user.admin? 
      can :manage, :all
      cannot :manage, Account
      cannot :destroy, [Customer, Order, AdminUser, Account]
    end

    if user.office?
      can :manage, [Customer, Order]
      can :read, :all
      cannot :create, [OrderCategory, OrderPriority, OrderStatus, OrderType, ProductStatus, Account]
      cannot :destroy, :all
    end

    if user.warehouse?
      can :read, :all #I use this so this role can view information.
      can :update, Order
      cannot :create, :all
      cannot :destroy, :all
    end

    if user.broker?
      can :manage, [Order, Customer] 
      cannot :read, Account
      cannot :create, Account
      cannot :destroy, :all
    end
  end
end
