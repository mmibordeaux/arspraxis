# == Schema Information
#
# Table name: referential_resources
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  competency_id  :bigint
#  referential_id :bigint
#
# Indexes
#
#  index_referential_resources_on_competency_id   (competency_id)
#  index_referential_resources_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (competency_id => referential_competencies.id)
#

class Referential::Resource < ApplicationRecord
  belongs_to :referential
  belongs_to :competency

  default_scope { order(:id) }

  def code
    "R#{id}"
  end

  def to_s
    "#{name}"
  end
end
