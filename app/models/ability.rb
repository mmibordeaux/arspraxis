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
    referential_ids = [1, 2]
    can :manage, Referential, id: referential_ids
    cannot :create, Referential
    can :create, Referential if @user.admin?
    can :manage, Referential::Competency, referential_id: referential_ids
    can :manage, Referential::CriticalLearning, referential_id: referential_ids
    can :manage, Referential::Level, referential_id: referential_ids
    can :manage, Referential::Resource, referential_id: referential_ids
    can :manage, Referential::Situation, referential_id: referential_ids
  end

  def users
    can :manage, User if @user.admin?
  end
end
