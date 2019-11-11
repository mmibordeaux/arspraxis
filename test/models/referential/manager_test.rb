# == Schema Information
#
# Table name: referential_managers
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  referential_id :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_referential_managers_on_referential_id  (referential_id)
#  index_referential_managers_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (referential_id => referentials.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class Referential::ManagerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
