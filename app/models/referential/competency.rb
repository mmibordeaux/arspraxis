# == Schema Information
#
# Table name: referential_competencies
#
#  id                   :bigint           not null, primary key
#  description          :text
#  essential_components :text
#  name                 :string
#  number               :integer
#  short_name           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  referential_id       :bigint
#
# Indexes
#
#  index_referential_competencies_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (referential_id => referentials.id)
#

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
    "C#{number}. #{short_name}"
  end
end
