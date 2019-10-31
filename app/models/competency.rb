# == Schema Information
#
# Table name: competencies
#
#  id                   :integer          not null, primary key
#  name                 :string
#  short_name           :string
#  description          :text
#  number               :integer
#  referential_id       :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  essential_components :text
#

class Competency < ApplicationRecord
  belongs_to :referential

  has_many :situations
  has_many :resources
  has_many :critical_learnings

  default_scope { order(:number) }

  def full_description
    "#{description} #{essential_components}"
  end

  def to_s
    "#{short_name}"
  end
end
