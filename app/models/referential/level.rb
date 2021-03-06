# == Schema Information
#
# Table name: referential_levels
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string
#  number         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competency_id  :bigint
#  referential_id :bigint
#
# Indexes
#
#  index_referential_levels_on_competency_id   (competency_id)
#  index_referential_levels_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (competency_id => referential_competencies.id)
#  fk_rails_...  (referential_id => referentials.id)
#

class Referential::Level < ApplicationRecord
  belongs_to :referential
  belongs_to :competency, optional: true
  has_many :situations
  has_many :critical_learnings

  scope :with_competency, -> { where.not(competency: nil) }
  scope :without_competency, -> { where(competency: nil) }
  default_scope { order('number, competency_id NULLS FIRST') }

  def monocompetency?
    competency.present?
  end

  def multicompetency?
    !monocompetency?
  end

  def for_competency(competency)
    referential.levels.find_by(competency: competency, number: number) || self
  end

  def code
    "N#{number}"
  end

  def to_s
    "#{code}. #{name}"
  end
end
