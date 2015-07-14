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
#

class Mission < ActiveRecord::Base
  belongs_to :client, class_name: 'User', foreign_key: :client_id
  belongs_to :agent, class_name: 'User', foreign_key: :agent_id
end
