class Ability
  include CanCan::Ability

  def initialize(current_user)
    if current_user
      #A user can only edit themselves
      can :update, User do |user|
        user && user == current_user
      end
    end
  end
end