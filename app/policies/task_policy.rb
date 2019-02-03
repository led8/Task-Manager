class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def show?
      # record.user == user
      true
    end
  end
end
