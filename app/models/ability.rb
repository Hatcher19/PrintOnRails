class Ability
  include CanCan::Ability

  def initialize(user)

        return if user.nil? #non logged in user can use this.

        if user.admin?
            can :manage, :all
        end

        if user.sales?
            can :create, [Order, Customer]
            can :read, :all
            can :update, [Order, Customer]
            cannot :destroy, :all
        end

        if user.production?
            can :create, [Order, Customer]
            can :read, :all
            can :update, [Order, Customer]
            cannot :destroy, :all
        end

        if user.art?
            cannot :create, :all
            can :read, :all
            can :update, Order
            cannot :destroy, :all
        end

        if user.shipping?
            cannot :create, :all
            can :read, :all
            can :update, Order
            cannot :destroy, :all
        end
    end
end


# Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities