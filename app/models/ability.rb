class Ability
  include CanCan::Ability

  def initialize user
     user ||= User.new
    if user && (user.has_role? User::ROLES[:admin])
      can :manage, :all
      #binding.pry
     # can [:create,:update, :destroy], [Project, Category, User, Technique]
    else
      can :read, :all
    end
  end
end
