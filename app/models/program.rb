# == Schema Information
#
# Table name: programs
#
#  id             :bigint           not null, primary key
#  city           :string
#  country        :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  referential_id :bigint
#
# Indexes
#
#  index_programs_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (referential_id => referentials.id)
#

class Program < ApplicationRecord
  belongs_to :referential
  has_many :groups
  has_many :teachers

  default_scope { order(:name) }

  def country_full
    ISO3166::Country.new(country).to_s
  end

  def to_s
    "#{name}"
  end
end
