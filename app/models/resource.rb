# == Schema Information
#
# Table name: resources
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  competency_id :integer
#

class Resource < ApplicationRecord
  belongs_to :competency

  default_scope { order(:name) }

  def to_s
    "#{name}"
  end
end
