# == Schema Information
#
# Table name: competencies
#
#  id             :integer          not null, primary key
#  name           :string
#  short_name     :string
#  description    :text
#  position       :integer
#  referential_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Competency < ApplicationRecord
  belongs_to :referential

  default_scope { order(:position) }

  def to_s
    "#{short_name}"
  end
end
