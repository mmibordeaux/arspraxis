# == Schema Information
#
# Table name: situations
#
#  id            :integer          not null, primary key
#  description   :text
#  number        :integer
#  competency_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SituationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
