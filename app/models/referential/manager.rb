class Referential::Manager < ApplicationRecord
  belongs_to :referential
  belongs_to :user

  def to_s
    "#{user}"
  end
end
