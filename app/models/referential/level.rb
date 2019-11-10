class Referential::Level < ApplicationRecord
  belongs_to :referential

  def to_s
    "#{name}"
  end
end
