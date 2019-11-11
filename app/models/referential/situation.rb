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
#  referential_id :bigint
#
# Indexes
#
#  index_referential_situations_on_competency_id   (competency_id)
#  index_referential_situations_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (competency_id => referential_competencies.id)
#

class Referential::Situation < ApplicationRecord
  belongs_to :competency
  belongs_to :referential

  default_scope { order(:number) }

  def to_s
    "S#{number}. #{name}"
  end
end
