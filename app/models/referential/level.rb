# == Schema Information
#
# Table name: referential_levels
#
#  id             :integer          not null, primary key
#  number         :integer
#  name           :string
#  referential_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Referential::Level < ApplicationRecord
  belongs_to :referential

  def to_s
    "#{name}"
  end
end
