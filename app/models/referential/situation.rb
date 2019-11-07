# == Schema Information
#
# Table name: referential_situations
#
#  id            :integer          not null, primary key
#  description   :text
#  number        :integer
#  competency_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Referential::Situation < ApplicationRecord
  belongs_to :competency
  delegate :referential, to: :competency

  default_scope { order(:number) }

  def to_s
    "#{description}"
  end
end
