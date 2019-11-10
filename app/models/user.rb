# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :teacher_in_programs,
            class_name: 'Program::Teacher'
  has_many  :manager_of_referentials,
            class_name: 'Referential::Manager'

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
