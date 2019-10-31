# == Schema Information
#
# Table name: critical_learnings
#
#  id                :integer          not null, primary key
#  competency_id     :integer
#  level_id          :integer
#  description       :text
#  number            :integer
#  not_reached       :text
#  partially_reached :text
#  reached           :text
#  over_reached      :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CriticalLearningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
