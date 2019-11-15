# == Schema Information
#
# Table name: user_students
#
#  id         :bigint           not null, primary key
#  confirmed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_students_on_group_id  (group_id)
#  index_user_students_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => program_groups.id)
#  fk_rails_...  (user_id => users.id)
#

class User::Student < ApplicationRecord
  belongs_to :user
  belongs_to  :group,
              class_name: 'Program::Group'

  scope :confirmed, -> { where(confirmed: true) }
  scope :unconfirmed, -> { where(confirmed: false) }

  def to_s
    "#{user}"
  end
end
