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
          can :read, :all #I use this so this role can view information.
          can :update, Order
          cannot :create, :all
          cannot :destroy, :all
        end

        if user.broker?
          can [:index, :create, :read, :update, :new, :edit], [Order, Customer], :admin_user_id => user.id
          can :read, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser]
          cannot :index, [AdminUser] #DO NOT DELETE! I use this to distinguish can? throughout app. 
          cannot :read, AdminUser
          cannot :destroy, :all
        end
      end
end
