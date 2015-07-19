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
#  status         :integer
#

class Mission < ActiveRecord::Base
  belongs_to :client, class_name: 'User'
  belongs_to :agent, class_name: 'User'

  validates_presence_of :address, :landlord_phone

  enum status: [:uncheck, :contacted, :finished, :aborted]
end
