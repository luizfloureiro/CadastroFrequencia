# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.secretaria?
      can :manage, User, cargo: 'Professor'
    elsif user.admin?
      can :manage, User, :all
    end
  end
end
