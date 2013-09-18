class Ability
  include CanCan::Ability

  def initialize(user)

        return if user.nil? #non logged in user can use this.

        if user.admin?
            can :manage, :all
        end

        if user.sales?
            can :create, :all
            can :read, :all
            can :edit, :all
            cannot :create, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser]
            cannot :destroy, :all
        end

        if user.production?
            can :manage, :all
            cannot :create, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser, Customer]
            cannot :update, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser, Customer]
            cannot :destroy, [Order, Customer, OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser]
        end

        if user.art?
            can :manage, :all
            cannot :create, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser, Order, Customer]
            cannot :destroy, :all
        end

        if user.shipping?
            cannot :create, :all
            can :read, :all
            can :update, Order
            cannot :destroy, :all
        end

        if user.broker?
            can [:index, :create, :read, :update, :new, :edit], [Order, Customer], :admin_user_id => user.id
            can :read, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser]
            cannot :index, [AdminUser]
            cannot :destroy, :all
        end
    end
end
