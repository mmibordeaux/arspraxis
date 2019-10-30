# == Schema Information
#
# Table name: levels
#
#  id             :integer          not null, primary key
#  number         :integer
#  name           :string
#  referential_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
