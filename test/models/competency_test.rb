# == Schema Information
#
# Table name: competencies
#
#  id                   :integer          not null, primary key
#  name                 :string
#  short_name           :string
#  description          :text
#  number               :integer
#  referential_id       :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  essential_components :text
#

require 'test_helper'

class CompetencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
