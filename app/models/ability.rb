class Ability
  include CanCan::Ability

  def initialize(current_user)
    #Everyone can read/view nuggets
    can :read, Nugget do
      true
    end

    if current_user
      #A user can only edit themselves
      can :update, User do |user|
        user && user == current_user
      end

      #A logged in user can create nuggets
      can :create, Nugget do
        true
      end

      #A user can only edit their own nuggets
      can :update, Nugget do |nugget|
        nugget && nugget.user == current_user
      end
    end
  end
end