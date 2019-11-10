class Referential::CriticalLearning < ApplicationRecord
  belongs_to :competency
  belongs_to :level
  belongs_to :referential

  scope :with_level, -> (level) { where(level: level) }
  scope :with_compency, -> (competency) { where(competency: competency) }
  default_scope { order(:number) }

  def to_s
    "#{description}"
  end
end
