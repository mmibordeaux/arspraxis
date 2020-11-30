# == Schema Information
#
# Table name: referential_situations
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string
#  number         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competency_id  :bigint
#  level_id       :bigint
#  referential_id :bigint
#
# Indexes
#
#  index_referential_situations_on_competency_id   (competency_id)
#  index_referential_situations_on_level_id        (level_id)
#  index_referential_situations_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (competency_id => referential_competencies.id)
#

class Referential::Situation < ApplicationRecord
  belongs_to :referential
  belongs_to :level, optional: true
  belongs_to :competency, optional: true

  scope :with_level, -> (level) { where(level: level) }
  default_scope { order(:number) }

  validates_presence_of :number, :name

  def code
    unless @code
      @code = ''
      @code += "L#{level.number}" if level
      @code += "C#{competency.number}" if competency
      @code += "S#{number}"
    end
    @code
  end

  def to_s
    "#{code}. #{name}"
  end
end
