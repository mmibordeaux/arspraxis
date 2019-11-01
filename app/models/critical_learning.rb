# == Schema Information
#
# Table name: critical_learnings
#
#  id                :integer          not null, primary key
#  competency_id     :integer
#  level_id          :integer
#  description       :text
#  number            :integer
#  not_reached       :text
#  partially_reached :text
#  reached           :text
#  over_reached      :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CriticalLearning < ApplicationRecord
  belongs_to :competency
  belongs_to :level

  scope :with_level, -> (level) { where(level: level) }
  scope :with_compency, -> (competency) { where(competency: competency) }
  default_scope { order(:number) }

  def to_s
    "#{description}"
  end
end
