class Ability
  include CanCan::Ability

  def initialize(user)

        return if user.nil? #non logged in user can use this.

        if user.admin? 
          can :manage, :all
          cannot :destroy, [Customer, Order]
        end

        if user.office?
          can :manage, [Customer, Order]
          can :read, :all
          cannot :create, [OrderCategory, OrderPriority, OrderStatus, OrderType]
          cannot :destroy, :all
        end

        if user.warehouse?
          can :read, :all
          can :update, Order
          cannot :create, :all
          cannot :destroy, :all
        end

        if user.broker?
          can :manage, [Customer, Order]
          can :read, :all
          cannot [:create, :index], [OrderCategory, OrderPriority, OrderStatus, OrderType]
          cannot :destroy, :all
        end
      end
end
