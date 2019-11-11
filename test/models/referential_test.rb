# == Schema Information
#
# Table name: referentials
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  origin      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ReferentialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
