# == Schema Information
#
# Table name: referentials
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  origin      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Referential < ApplicationRecord
  has_many :competencies
  has_many :critical_learnings
  has_many :levels
  has_many :managers
  has_many :programs
  has_many :resources
  has_many :situations

  has_one_attached :image

  default_scope { order(:name) }

  def level_numbers
    @level_numbers ||= levels.pluck(:number).uniq.sort
  end

  def to_s
    "#{name}"
  end
end
