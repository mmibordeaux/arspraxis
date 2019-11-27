# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :publications
  has_many  :teacher_in_programs,
            class_name: 'Program::Teacher'
  has_many  :manager_of_referentials,
            class_name: 'Referential::Manager'
  has_many  :student_in_groups,
            class_name: 'User::Student'
  has_many  :evaluations
  has_many :students

  def teaches_in?(program)
    teacher_in_programs.where(program: program).any?
  end

  def studies_in?(group)
    student_in_groups.where(group: group, confirmed: true).any?
  end

  def validated?(critical_learning)
    User::Evaluation.where(referential_critical_learning: critical_learning, publication: publications, validated: true).count > 1
  end

  def name
    if first_name.blank? && last_name.blank?
      "Utilisateur anonyme #{id}"
    else
      "#{first_name} #{last_name}"
    end
  end

  def to_s
    "#{name}"
  end
end
