# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  name           :string
#  city           :string
#  country        :string
#  referential_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Program < ApplicationRecord
  belongs_to :referential
  has_many :groups
  has_many :teachers

  def country_full
    ISO3166::Country[country].name
  end

  def to_s
    "#{name}"
  end
end
