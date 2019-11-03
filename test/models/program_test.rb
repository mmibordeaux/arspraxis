# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  name           :string
#  city           :string
#  country        :string
#  referential_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
