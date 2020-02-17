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
#  level_id       :bigint
#  referential_id :bigint
#
# Indexes
#
#  index_referential_situations_on_level_id        (level_id)
#  index_referential_situations_on_referential_id  (referential_id)
#

class Referential::Situation < ApplicationRecord
  belongs_to :referential
  belongs_to :level

  scope :with_level, -> (level) { where(level: level) }
  default_scope { order(:number) }

  def code
    "S#{number}"
  end

  def to_s
    "#{code}. #{name}"
  end
end
