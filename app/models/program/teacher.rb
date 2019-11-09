class Program::Teacher < ApplicationRecord
  belongs_to :program
  belongs_to :user

  def to_s
    "#{user}"
  end
end
