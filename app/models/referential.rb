# == Schema Information
#
# Table name: referentials
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  origin      :string
#  description :text
#

class Referential < ApplicationRecord
  has_many :competencies
  has_many :critical_learnings
  has_many :levels
  has_many :managers
  has_many :programs
  has_many :resources
  has_many :situations

  def to_s
    "#{name}"
  end
end
