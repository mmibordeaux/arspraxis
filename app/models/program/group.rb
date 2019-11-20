# == Schema Information
#
# Table name: program_groups
#
#  id         :bigint           not null, primary key
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :bigint
#
# Indexes
#
#  index_program_groups_on_program_id  (program_id)
#
# Foreign Keys
#
#  fk_rails_...  (program_id => programs.id)
#

class Program::Group < ApplicationRecord
  belongs_to :program
  has_many  :students,
            class_name: 'User::Student'
  has_many  :publications,
            class_name: 'User::Publication',
            foreign_key: :program_group_id

  delegate :referential, to: :program

  def name_with_program
    "#{program} - #{to_s}"
  end

  def to_s
    "Promotion #{year}"
  end
end
