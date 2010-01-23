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

      #Any logged in user can create nuggets
      can :create, Nugget do
        true
      end

      #A normal user can only edit their own nuggets
      #An admin user can edit any nugget
      can :update, Nugget do |nugget|
        nugget && (nugget.user == current_user || current_user.is_admin)
      end
    end
  end
end