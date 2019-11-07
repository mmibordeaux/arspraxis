# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  year       :integer
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  belongs_to :program

  def to_s
    "#{year}"
  end
end
