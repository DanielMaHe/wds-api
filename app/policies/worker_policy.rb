class WorkerPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    def manage?
      user.admin?
    end
  end

  def index
    manage?
  end
end
