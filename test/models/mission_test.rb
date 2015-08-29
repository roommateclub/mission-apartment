# == Schema Information
#
# Table name: missions
#
#  id             :integer          not null, primary key
#  client_id      :integer
#  agent_id       :integer
#  address        :string
#  landlord_phone :string
#  url            :string
#  note           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  status         :integer          default(0)
#

require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
