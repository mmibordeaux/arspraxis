# == Schema Information
#
# Table name: referential_critical_learnings
#
#  id                :bigint           not null, primary key
#  description       :text
#  name              :string
#  not_reached       :text
#  number            :integer
#  over_reached      :text
#  partially_reached :text
#  reached           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  competency_id     :bigint
#  level_id          :bigint
#  referential_id    :bigint
#
# Indexes
#
#  index_referential_critical_learnings_on_competency_id   (competency_id)
#  index_referential_critical_learnings_on_level_id        (level_id)
#  index_referential_critical_learnings_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (competency_id => referential_competencies.id)
#  fk_rails_...  (level_id => referential_levels.id)
#

class Referential::CriticalLearning < ApplicationRecord
  belongs_to :competency
  belongs_to :level
  belongs_to :referential

  scope :with_level, -> (level) { where(level: level) }
  scope :with_compency, -> (competency) { where(competency: competency) }
  default_scope { order(:number) }

  def to_s
    "CL#{number}. #{name}"
  end
end
