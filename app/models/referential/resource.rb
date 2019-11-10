class Referential::Resource < ApplicationRecord
  belongs_to :competency
  belongs_to :referential

  default_scope { order(:name) }

  def to_s
    "#{name}"
  end
end
