class Referential::Competency < ApplicationRecord
  belongs_to :referential

  has_many :situations
  has_many :resources
  has_many :critical_learnings

  default_scope { order(:number) }

  def full_description
    "#{description} #{essential_components}"
  end

  def to_s
    "#{number}. #{short_name}"
  end
end
