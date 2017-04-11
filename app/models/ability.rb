class Ability
  include CanCan::Ability

  def initialize user
     user ||= User.new
    if user && (user.has_role? User::ROLES[:admin])
      can :manage, :all
     can [:index, :show, :create,:update, :destroy], [Project, Category, User, Technique, Role]
    else
      can :read, :all
    end
  end
end
