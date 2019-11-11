# == Schema Information
#
# Table name: programs
#
#  id             :bigint           not null, primary key
#  city           :string
#  country        :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  referential_id :bigint
#
# Indexes
#
#  index_programs_on_referential_id  (referential_id)
#
# Foreign Keys
#
#  fk_rails_...  (referential_id => referentials.id)
#

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
