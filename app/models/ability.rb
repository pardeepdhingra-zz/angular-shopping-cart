class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= Admin.new

    if admin.has_role? :super_admin
        can :manage, :all
    elsif admin.has_role? :moderator
        can :manage, Product
    else
        cannot :read, :all
        cannot :manage, :all
    end
  end
end
