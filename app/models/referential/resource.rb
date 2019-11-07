# == Schema Information
#
# Table name: referential_resources
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competency_id :integer
#

class Referential::Resource < ApplicationRecord
  belongs_to :competency

  default_scope { order(:name) }

  def to_s
    "#{name}"
  end
end
