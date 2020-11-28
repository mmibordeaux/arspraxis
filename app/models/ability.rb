# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    can :index, :all
    can :show, :all
    can :visualize, Referential
    can :visualize, Referential::Competency
    can :number, Referential::Level
    user_authentified if @user.present?
  end

  def user_authentified
    programs
    referentials
    users
    admin
  end

  def programs
    can :manage, Program, id: teacher_in_programs_ids
    cannot :create, Program
    can :create, Program if @user.admin?
    can :manage, Program::Group, program_id: teacher_in_programs_ids
    can :manage, Program::Teacher, program_id: teacher_in_programs_ids
    can :evaluate, User::Publication, program_group_id: teacher_in_program_group_ids, published: true
  end

  def referentials
    can :manage, Referential, id: manager_of_referentials_ids
    cannot :create, Referential # Admin only
    can :manage, Referential::Competency, referential_id: manager_of_referentials_ids
    can :manage, Referential::CriticalLearning, referential_id: manager_of_referentials_ids
    can :manage, Referential::Level, referential_id: manager_of_referentials_ids
    can :manage, Referential::Resource, referential_id: manager_of_referentials_ids
    can :manage, Referential::Situation, referential_id: manager_of_referentials_ids
    can :manage, Referential::Manager, referential_id: manager_of_referentials_ids
  end

  def users
    can :me, User
    can :update, User
    can :manage, User if @user.admin?
    can :manage, User::Publication, user_id: @user.id
    can :manage, User::Student, user_id: @user.id
    can :manage, User::Evaluation, user_id: @user.id
  end

  def admin
    can :manage, :all if @user.admin?
  end

  protected

  def teacher_in_programs_ids
    @teacher_in_programs_ids ||= @user.teacher_in_programs.pluck(:program_id)
  end

  def manager_of_referentials_ids
    @referential_ids ||= @user.manager_of_referentials.pluck(:referential_id)
  end

  def teacher_in_program_group_ids
    @teacher_in_program_group_ids = Program::Group.where(program_id: teacher_in_programs_ids).pluck(:id)
  end
end
