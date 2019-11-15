# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    can :index, :all
    can :show, :all
    user_authentified if @user.present?
  end

  def user_authentified
    programs
    referentials
    users
    admin
  end

  def programs
    program_ids = @user.teacher_in_programs.pluck(:program_id)
    can :manage, Program, id: program_ids
    cannot :create, Program
    can :create, Program if @user.admin?
    can :manage, Program::Group, program_id: program_ids
    can :manage, Program::Teacher, program_id: program_ids
    # TODO teacher admin only?
    # Teacher must be able to evaluate
  end

  def referentials
    referential_ids = @user.manager_of_referentials.pluck(:referential_id)
    can :manage, Referential, id: referential_ids
    cannot :create, Referential
    can :manage, Referential::Competency, referential_id: referential_ids
    can :manage, Referential::CriticalLearning, referential_id: referential_ids
    can :manage, Referential::Level, referential_id: referential_ids
    can :manage, Referential::Resource, referential_id: referential_ids
    can :manage, Referential::Situation, referential_id: referential_ids
    can :manage, Referential::Manager, referential_id: referential_ids
  end

  def users
    can :me, User
    can :update, User
    can :manage, User if @user.admin?
    can :manage, User::Publication, user_id: @user.id
    can :manage, User::Student, user_id: @user.id
  end

  def admin
    can :manage, :all if @user.admin?
  end
end
