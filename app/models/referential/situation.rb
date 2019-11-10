class Referential::Situation < ApplicationRecord
  belongs_to :competency
  belongs_to :referential

  default_scope { order(:number) }

  def to_s
    "#{description}"
  end
end
