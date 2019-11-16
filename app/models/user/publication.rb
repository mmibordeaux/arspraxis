# == Schema Information
#
# Table name: user_publications
#
#  id               :bigint           not null, primary key
#  content          :text
#  published        :boolean          default(FALSE)
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  program_group_id :bigint
#  user_id          :bigint
#
# Indexes
#
#  index_user_publications_on_program_group_id  (program_group_id)
#  index_user_publications_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (program_group_id => program_groups.id)
#  fk_rails_...  (user_id => users.id)
#

class User::Publication < ApplicationRecord
  belongs_to :user
  belongs_to  :program_group,
              class_name: 'Program::Group'
  alias :group :program_group

  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: false) }

  def to_s
    "#{title}"
  end
end
