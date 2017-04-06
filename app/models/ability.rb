class Ability
  include CanCan::Ability

  def initialize user
    if user && (user.has_role? User::ROLES[:admin])
      can :manage, :all
     # can [:create,:update, :destroy], [Project, Category, User, Technique]
    else
      can :read, :all
    end
  end
end
