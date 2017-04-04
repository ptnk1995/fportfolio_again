class Ability
  include CanCan::Ability

  def initialize user
    if user && (user.has_role? User::ROLES[:admin])
      can :manage, :all
      can [:update, :destroy], [Project, Category]
    else
      can :read, :all
    end
  end
end
