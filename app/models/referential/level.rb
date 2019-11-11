# == Schema Information
#
# Table name: referential_levels
#
#  id             :bigint           not null, primary key
#  description    :text
#  name           :string
#  number         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  referential_id :bigint
#
# Indexes
#
#  index_referential_levels_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (referential_id => referentials.id)
#

class Referential::Level < ApplicationRecord
  belongs_to :referential

  def to_s
    "N#{number}. #{name}"
  end
end
